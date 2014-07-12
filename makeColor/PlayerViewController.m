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

@end

@implementation PlayerViewController

@synthesize imageView;
@synthesize timer;
@synthesize transitions;
@synthesize database;
@synthesize seed,index;
@synthesize greenBegin,greenEnd,redBegin,redEnd,blueBegin,blueEnd;
@synthesize greenNewValue;


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
    // transitions is action
    self.seed=0.005f;
    self.index=1;

    
    // main loop
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(pulse) userInfo:nil repeats:YES];
    [self loadTransitions];
    [self loopControl];
    
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.timer invalidate];
}


#pragma mark - Timer Methods
-(void)pulse {
    NSLog(@".......");
    [self greenPulsing];
}

#pragma mark - Working Methods
-(void)loadTransitions {
    self.transitions=[self.database getTransitions];
}
-(void)redPulsing {
    
}
-(void)greenPulsing {
    self.greenNewValue=self.greenNewValue+seed;
    
    NSLog(@"newValue=%f         end=%f",self.greenNewValue,self.greenEnd);
    
    
    if (self.greenNewValue>self.greenEnd) {
        NSLog(@"GREEN stop seeding");
        return;
    }
    self.imageView.backgroundColor=[UIColor colorWithRed:self.redBegin green:self.greenNewValue blue:self.blueBegin alpha:1];

}
-(void)bluePulsing {
    
}
-(void)loopControl {
    Transition *transitionBegin=[self.transitions objectAtIndex:index-1];
    Transition *transitionEnd=[self.transitions objectAtIndex:index];

    // Range Values
    self.redBegin=transitionBegin.red;
    self.redEnd=transitionEnd.red;
    
    self.greenBegin=transitionBegin.green;
    self.greenEnd=transitionEnd.green;
    self.greenNewValue=self.greenBegin;
    
    NSLog(@"greenBegin=%f  greenEnd=%f",self.greenBegin,self.greenEnd);
    
    self.blueBegin=transitionBegin.blue;
    self.blueEnd=transitionEnd.blue;
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
