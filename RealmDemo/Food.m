//
//  Food.m
//  RealmDemo
//
//  Created by Kevin Moy on 9/11/14.
//  Copyright (c) 2014 Kevin Moy. All rights reserved.
//

#import "Food.h"
#import <Realm/Realm.h>

@interface FoodDatabase: RLMObject

@property NSString *name;
@property NSString *type;
@property NSString *ingredients;
@property NSString *foodID;

@end

@implementation FoodDatabase

@end

RLM_ARRAY_TYPE(FoodDatabase)

@implementation Food

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@: %@",
                                   self.foodType, self.foodName];
    
    return descriptionString;
}
- (instancetype)initWithFoodName:(NSString *)name
                       foodType:(NSString *)type
                 foodIngredients:(NSString *)ingredients
{
    // Call the superclass's designated initializer
    self = [super init];
    // Did the superclass's designated initializer succeed?
    if (self) {
        // Give the instance variables initial values
        self.foodName = name;
        self.foodType = type;
        self.foodIngredients = ingredients;
        
        // Create a NSUUID object - and get its string representation
        NSUUID *uuid = [[NSUUID alloc] init];
        NSString *key = [uuid UUIDString];
        _foodKey = key;
    }
    
    // Return the address of the newly initialized object
    return self;
}

- (id)init {
    return [self initWithFoodName:@""
                        foodType:@"" foodIngredients:@""];
}
- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.foodName forKey:@"foodName"];
    [aCoder encodeObject:self.foodType forKey:@"foodType"];
    [aCoder encodeObject:self.foodIngredients forKey:@"foodIngredients"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _foodName = [aDecoder decodeObjectForKey:@"foodName"];
        _foodType = [aDecoder decodeObjectForKey:@"foodType"];
        _foodIngredients = [aDecoder decodeObjectForKey:@"foodIngredients"];
    }
    return self;
}
@end
