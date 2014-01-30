//
//  ViewController.h
//  makeColor
//
//  Created by Marcelo Sampaio on 12/13/13.
//  Copyright (c) 2013 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *colorPane;
@property (weak, nonatomic) IBOutlet UISlider *redValue;
@property (weak, nonatomic) IBOutlet UISlider *greenValue;
@property (weak, nonatomic) IBOutlet UISlider *blueValue;

@property (weak, nonatomic) IBOutlet UILabel *labelRed;
@property (weak, nonatomic) IBOutlet UILabel *labelGreen;
@property (weak, nonatomic) IBOutlet UILabel *labelBlue;



@end
