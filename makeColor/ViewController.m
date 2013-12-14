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
}



-(void)resetControls
{
    self.redValue.value=0;
    self.greenValue.value=0;
    self.blueValue.value=0;
    
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
