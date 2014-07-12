//
//  PlayerViewController.h
//  makeColor
//
//  Created by Marcelo Sampaio on 7/12/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"

@interface PlayerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) NSMutableArray *transitions;


// database properties
@property (nonatomic,strong) Database *database;

// transitions in action
@property float seed;
@property int index;

@property float redBegin;
@property float redEnd;
@property float greenBegin;
@property float greenEnd;
@property float blueBegin;
@property float blueEnd;

@property float greenNewValue;

@end
