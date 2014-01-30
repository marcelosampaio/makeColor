//
//  ViewController.m
//  makeColor
//
//  Created by Marcelo Sampaio on 12/13/13.
//  Copyright (c) 2013 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize colorPane,redValue,greenValue,blueValue;
@synthesize labelBlue,labelGreen,labelRed;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self resetControls];
}

- (IBAction)redAction:(UISlider *)sender {
    [self changeColor];
}

- (IBAction)greenAction:(UISlider *)sender {
    [self changeColor];
}

- (IBAction)blueAction:(UISlider *)sender {
    [self changeColor];
}

-(void)changeColor
{
    self.colorPane.backgroundColor=[UIColor colorWithRed:self.redValue.value green:self.greenValue.value blue:self.blueValue.value alpha:1.00f];
    self.labelRed.text=[NSString stringWithFormat:@"%f",self.redValue.value];
    self.labelGreen.text=[NSString stringWithFormat:@"%f",self.greenValue.value];
    self.labelBlue.text=[NSString stringWithFormat:@"%f",self.blueValue.value];
}



-(void)resetControls
{
    self.redValue.value=0;
    self.greenValue.value=0;
    self.blueValue.value=0;
    
    self.labelRed.text=@"0";
    self.labelGreen.text=@"0";
    self.labelBlue.text=@"0";
    

    [self changeColor];
    
    self.redValue.minimumTrackTintColor=[UIColor redColor];
    self.redValue.maximumTrackTintColor=[UIColor blackColor];
    self.redValue.thumbTintColor=[UIColor redColor];
    
    self.greenValue.minimumTrackTintColor=[UIColor greenColor];
    self.greenValue.maximumTrackTintColor=[UIColor blackColor];
    self.greenValue.thumbTintColor=[UIColor greenColor];

    self.blueValue.minimumTrackTintColor=[UIColor blueColor];
    self.blueValue.maximumTrackTintColor=[UIColor blackColor];
    self.blueValue.thumbTintColor=[UIColor blueColor];
}


// Esconder atatus bar
- (BOOL)prefersStatusBarHidden {
    return YES;
}

// Não permite rotacao
- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
