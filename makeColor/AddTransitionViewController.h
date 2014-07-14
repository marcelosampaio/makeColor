//
//  AddTransitionViewController.h
//  makeColor
//
//  Created by Marcelo Sampaio on 7/12/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "Transition.h"

@interface AddTransitionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

// database property
@property (nonatomic,strong) Database *database;

// segue parameter
@property (strong,nonatomic) NSString *segueAction;
@property (strong,nonatomic) Transition *transition;


@end
