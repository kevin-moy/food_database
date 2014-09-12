//
//  Food.h
//  RealmDemo
//
//  Created by Kevin Moy on 9/11/14.
//  Copyright (c) 2014 Kevin Moy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject <NSCoding>

@property (nonatomic, copy) NSString *foodName;
@property (nonatomic, copy) NSString *foodType;
@property (nonatomic, copy) NSString *foodKey;
@property (nonatomic, copy) NSString *foodIngredients;

- (instancetype)initWithFoodName:(NSString *)name
                  foodType:(NSString *)type
                    foodIngredients:(NSString *)ingredients;
@end
