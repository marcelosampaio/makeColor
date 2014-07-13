//
//  PlayerViewController.m
//  makeColor
//
//  Created by Marcelo Sampaio on 7/12/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "PlayerViewController.h"
#import "Transition.h"

@interface PlayerViewController ()
@property BOOL firstTime;

@end

@implementation PlayerViewController

@synthesize imageView;
@synthesize timer;
@synthesize transitions;
@synthesize database;
@synthesize redSeed,greenSeed,blueSeed,index;
@synthesize greenBegin,greenEnd,redBegin,redEnd,blueBegin,blueEnd;
@synthesize redNewValue,greenNewValue,blueNewValue;
@synthesize redStopSeeding,greenStopSeeding,blueStopSeeding;
@synthesize firstTime;


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
    self.firstTime=YES;
    // database
    self.database=[[Database alloc]init];
    [self.database openDB];
    
    // transitions is action
    self.redSeed=0.005f;
    self.greenSeed=0.005f;
    self.blueSeed=0.005f;
    self.index=1;
    self.redStopSeeding=NO;
    self.greenStopSeeding=NO;
    self.blueStopSeeding=NO;

    [self loadTransitions];
    [self loopControl];
    
    // main loop
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(pulse) userInfo:nil repeats:YES];

    
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.timer invalidate];
}


#pragma mark - Timer Methods
-(void)pulse {
    [self redPulsing];
    [self greenPulsing];
    [self bluePulsing];
    self.imageView.backgroundColor=[UIColor colorWithRed:self.redNewValue green:self.greenNewValue blue:self.blueNewValue alpha:1];
}

#pragma mark - Working Methods
-(void)loadTransitions {
    self.transitions=[self.database getTransitions];
}
-(void)redPulsing {
    self.redNewValue=self.redNewValue+self.redSeed;
    
    if (redBegin<self.redEnd) {
        if (self.redNewValue>self.redEnd) {
            self.redStopSeeding=YES;
            return;
        }
    } else {
        if (self.redNewValue<self.redEnd) {
            self.redStopSeeding=YES;
            return;
        }
    }
}
-(void)greenPulsing {
    self.greenNewValue=self.greenNewValue+self.greenSeed;
    
    if (greenBegin<self.greenEnd) {
        if (self.greenNewValue>self.greenEnd) {
            self.greenStopSeeding=YES;
            return;
        }
    } else {
        if (self.greenNewValue<self.greenEnd) {
            self.greenStopSeeding=YES;
            return;
        }
    }
}
-(void)bluePulsing {
    self.blueNewValue=self.blueNewValue+self.blueSeed;
    
    if (blueBegin<self.blueEnd) {
        if (self.blueNewValue>self.blueEnd) {
            self.blueStopSeeding=YES;
            return;
        }
    } else {
        if (self.blueNewValue<self.blueEnd) {
            self.blueStopSeeding=YES;
            return;
        }
    }
}
-(void)loopControl {
    
    Transition *transitionBegin=[self.transitions objectAtIndex:index-1];
    Transition *transitionEnd=[self.transitions objectAtIndex:index];

    // Range Values
    if (self.firstTime) {
        self.redBegin=transitionBegin.red;
        self.redEnd=transitionEnd.red;
        self.redNewValue=self.redBegin;
        
        self.greenBegin=transitionBegin.green;
        self.greenEnd=transitionEnd.green;
        self.greenNewValue=self.greenBegin;
        
        self.blueBegin=transitionBegin.blue;
        self.blueEnd=transitionEnd.blue;
        self.blueNewValue=self.blueBegin;
        
        self.firstTime=NO;
    }
    
    //Seeds
    if (self.redBegin>self.redEnd) {
        self.redSeed=self.redSeed * -1;
    }
    if (self.greenBegin>self.greenEnd) {
        self.greenSeed=self.greenSeed * -1;
    }
    if (self.blueBegin>self.blueEnd) {
        self.blueSeed=self.blueSeed * -1;
    }
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
