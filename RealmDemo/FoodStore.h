//
//  FoodStore.h
//  RealmDemo
//
//  Created by Kevin Moy on 9/11/14.
//  Copyright (c) 2014 Kevin Moy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Food;

@interface FoodStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allFoods;

- (BOOL)saveChanges;
+ (instancetype)sharedStore;
- (Food *)createFood;
- (void)removeFood:(Food *)food;

- (void)moveFoodAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;

@end
