//
//  DetailViewController.h
//  RealmDemo
//
//  Created by Kevin Moy on 9/11/14.
//  Copyright (c) 2014 Kevin Moy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  Food;

@interface DetailViewController : UIViewController

- (instancetype)initForNewFood:(BOOL)isNew;

@property (nonatomic, strong) Food *food;
@property (nonatomic, copy) void (^dimissBlock)(void);

@end
