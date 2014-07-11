//
//  AddPresentationViewController.h
//  makeColor
//
//  Created by Marcelo Sampaio on 7/11/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"

@interface AddPresentationViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *presentationName;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveOutlet;
@property (weak, nonatomic) IBOutlet UISlider *transitionTime;


// Database property
@property (nonatomic,strong) Database *database;



@end
