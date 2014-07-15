//
//  AddTransitionViewController.m
//  makeColor
//
//  Created by Marcelo Sampaio on 7/12/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "AddTransitionViewController.h"

@interface AddTransitionViewController ()

@end

@implementation AddTransitionViewController

@synthesize database;
@synthesize imageView,redSlider,greenSlider,blueSlider;
@synthesize segueAction,transition;



#pragma mark - View Initialization
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.imageView.backgroundColor=[UIColor blackColor];
    self.redSlider.value=0.00f;
    self.redSlider.maximumTrackTintColor=[UIColor blackColor];
    self.greenSlider.value=0.00f;
    self.greenSlider.maximumTrackTintColor=[UIColor blackColor];
    self.blueSlider.value=0.00f;
    self.blueSlider.maximumTrackTintColor=[UIColor blackColor];
    
    self.database=[[Database alloc]init];
    [self.database openDB];
    
    if ([self.segueAction isEqualToString:@"EDIT"]) {
        self.imageView.backgroundColor=[UIColor colorWithRed:self.transition.red green:self.transition.green blue:self.transition.blue alpha:1];
        self.redSlider.value=self.transition.red;
        self.greenSlider.value=self.transition.green;
        self.blueSlider.value=self.transition.blue;
    }
    
    
}

#pragma mark - UI Actions
- (IBAction)changeRedColor:(id)sender {
    [self changeImageViewColor];
}

- (IBAction)changeGreenColor:(id)sender {
    [self changeImageViewColor];
}

- (IBAction)changeBlueColor:(id)sender {
    [self changeImageViewColor];
}

- (IBAction)saveColor:(id)sender {
    if ([self.segueAction isEqualToString:@"ADD"]) {
        [self.database addTransitionWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value];
    } else {
        [self.database updateTransitionWithRowId:transition.rowId red:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Working Methods
-(void)changeImageViewColor {
    self.imageView.backgroundColor=[UIColor colorWithRed:self.redSlider.value green:self.greenSlider.value blue:self.blueSlider.value alpha:1];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
