//
//  ViewController.m
//  RealmDemo
//
//  Created by Kevin Moy on 9/10/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "Food.h"
#import "FoodStore.h"
#import <Realm/Realm.h>
#import "Food.m"

@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    
//    FoodDatabase *myDatabase = [[FoodDatabase objectsWhere:@"foodID = '1'"] firstObject];
//    
//    if(!myDatabase) {
//        [realm beginWriteTransaction];
//        myDatabase = [[FoodDatabase alloc] init];
//        myDatabase.name = Food.foodName;
//        myDatabase.type = foodType;
//        myDatabase.ingredients = foodIngredients;
//        myDatabase.FoodID = @"1";
//        [realm addObject:myDatabase];
//        [realm commitWriteTransaction];
//        
//         NSLog(@"In my realm database(first call) -> %@", myDatabase.foodID);
//    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Good FOOD";
        
        // Create new bar button item to send addNewItem to ItemsViewController
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewFood:)];
        
        // Set this bar button item as right item in navigationItem
        navItem.rightBarButtonItem = bbi;
        navItem.leftBarButtonItem = self.editButtonItem;
    }
    
    return self;
}
- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[FoodStore sharedStore] allFoods] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    NSArray *foods = [[FoodStore sharedStore] allFoods];
    Food *food = foods[indexPath.row];
    
    cell.textLabel.text = [food description];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] initForNewFood:NO];
    
    NSArray *foods = [[FoodStore sharedStore] allFoods];
    Food *selectedFood = foods[indexPath.row];
    
    // Give detail view controller a pointer to the item object in row
    detailViewController.food = selectedFood;
    
    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:detailViewController
                                         animated:YES];
}

- (void)   tableView:(UITableView *)tableView
  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
   forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // If the table view is asking to commit a delete command...
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *foods = [[FoodStore sharedStore] allFoods];
        Food *food = foods[indexPath.row];
        [[FoodStore sharedStore] removeFood:food];
        
        // Also remove that row from the table view with an animation
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)   tableView:(UITableView *)tableView
  moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
         toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[FoodStore sharedStore] moveFoodAtIndex:sourceIndexPath.row
                                        toIndex:destinationIndexPath.row];
}

- (IBAction)addNewFood:(id)sender
{
    // Create a new food and add it to the store
    Food *newFood = [[FoodStore sharedStore] createFood];
    
    DetailViewController *detailViewController = [[DetailViewController alloc] initForNewFood:YES];
    
    detailViewController.food = newFood;
    
    detailViewController.dimissBlock = ^{
        [self.tableView reloadData];
    };
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    
    [self presentViewController:navController animated:YES completion:NULL];
    

}
@end
