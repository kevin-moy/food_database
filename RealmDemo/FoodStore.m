//
//  FoodStore.m
//  RealmDemo
//
//  Created by Kevin Moy on 9/11/14.
//  Copyright (c) 2014 Kevin Moy. All rights reserved.
//

#import "FoodStore.h"
#import "Food.h"

@interface FoodStore ()

@property (nonatomic) NSMutableArray *privateFoods;

@end

@implementation FoodStore

+ (instancetype)sharedStore
{
    static FoodStore *sharedStore;
    
    // Do I need to create sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use + [ItemStore sharedStore]"];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        NSString *path = [self foodArchivePath];
        _privateFoods = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        // If array hadn't been saved, creat new empty one
        if (!_privateFoods) {
            _privateFoods = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (NSArray *)allFoods
{
    return [self.privateFoods copy];
}

// Create a new item that user can change
- (Food *)createFood
{
    Food *food = [[Food alloc] init];
    
    [self.privateFoods addObject:food];
    
    return food;
}
- (void)removeFood:(Food *)food
{
//    NSString *key = food.foodKey;
    
//    // For images
//    [[ImageStore sharedStore] deleteImageForKey:key];
    
    [self.privateFoods removeObjectIdenticalTo:food];
}

- (void)moveFoodAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    // Get pointer to object being moved so can re-insert it
    Food *food = self.privateFoods[fromIndex];
    
    // Remove item from array
    [self.privateFoods removeObjectAtIndex:fromIndex];
    
    // Insert item in array at new location
    [self.privateFoods insertObject:food atIndex:toIndex];
    
}

- (NSString *)foodArchivePath
{
    // Make sure first argument is NSDocumentDictionary and not NSDocumentationDictionary
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get one document directory from that list
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:@"foods.archive"];
}

- (BOOL)saveChanges
{
    NSString *path = [self foodArchivePath];
    
    // Return yes on success
    return [NSKeyedArchiver archiveRootObject:self.privateFoods toFile:path];
}

@end
