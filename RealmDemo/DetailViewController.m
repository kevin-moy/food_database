//
//  DetailViewController.m
//  RealmDemo
//
//  Created by Kevin Moy on 9/11/14.
//  Copyright (c) 2014 Kevin Moy. All rights reserved.
//

#import "DetailViewController.h"
#import "Food.h"
#import "FoodStore.h"

@interface DetailViewController () <UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *typeField;

@property (weak, nonatomic) IBOutlet UITextField *descriptionField;
- (IBAction)backgroundTapped:(id)sender;

@end

@implementation DetailViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    Food *food = self.food;
    
    self.nameField.text = food.foodName;
    self.typeField.text = food.foodType;
    self.descriptionField.text = food.foodIngredients;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [self.view endEditing:YES];
    
    // "Save" changes to item
    Food *food = self.food;
  
    food.foodName = self.nameField.text;
    food.foodType = self.typeField.text;
    food.foodIngredients = self.descriptionField.text;
}

- (void)setFood:(Food *)food
{
    _food = food;
    self.navigationItem.title = _food.foodName;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (instancetype)initForNewFood:(BOOL)isNew
{
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        if (isNew) {
            UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                      target:self
                                                                                      action:@selector(save:)];
            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                        target:self
                                                                                        action:@selector(cancel:)];
            self.navigationItem.leftBarButtonItem = cancelItem;
            self.navigationItem.rightBarButtonItem = doneItem;
            
        }
    }
    return self;
}

- (void)save:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dimissBlock];
}

- (void)cancel:(id)sender
{
    // If user cancelled, remove item from store
    [[FoodStore sharedStore] removeFood:self.food];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dimissBlock];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

@end
