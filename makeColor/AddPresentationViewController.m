//
//  AddPresentationViewController.m
//  makeColor
//
//  Created by Marcelo Sampaio on 7/11/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "AddPresentationViewController.h"

@interface AddPresentationViewController ()

@end

@implementation AddPresentationViewController
@synthesize presentationName,transitionTime;
@synthesize database;
@synthesize segueParameter,segueName,segueValue,segueRowId;
@synthesize removeOutlet;

#pragma mark - Initialization
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

    if ([self.segueParameter isEqualToString:@"ADD"]) {
        [self.navigationItem.rightBarButtonItem setTitle:@"Save"];
        self.removeOutlet.hidden=YES;
    } else if ([self.segueParameter isEqualToString:@"EDIT"]) {
        [self.navigationItem.rightBarButtonItem setTitle:@"Update"];
        self.presentationName.text=self.segueName;
        self.transitionTime.value=self.segueValue;
        self.removeOutlet.hidden=NO;
    }
    
    
    // Database
    self.database=[[Database alloc]init];
    // Open database
    [self.database openDB];
    
    // Dismiss keyboard delegate
    self.presentationName.delegate=self;
}


#pragma mark - UI Actions
//- (IBAction)save:(id)sender {
//    
//    // Dismiss keyboard from UI
//    [self.presentationName resignFirstResponder];
//    
//    // check if presentation's name is filled
//    if (self.presentationName.text.length==0) {
//        [self dataEntryAlertWithMessage:@"Fill presentation's name!"];
//        return;
//    }
//    BOOL nameExists=[self.database presentationExistsWithName:self.presentationName.text];
//    if (nameExists) {
//        [self dataEntryAlertWithMessage:@"Name already exists!"];
//        return;
//    }
//    
//    // Add presentation to database
//    [self.database addPresentantionWithName:presentationName.text transitionTime:self.transitionTime.value transitionAudio:@""];
//
//
//    // Return to presentations
//    [self.navigationController popViewControllerAnimated:YES];
//}
- (IBAction)setTranstitionTime:(id)sender {

}
- (IBAction)removePresentation:(id)sender {
    [self.database removePresententionWithRowId:segueRowId];
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - Working Methods
-(void)dataEntryAlertWithMessage:(NSString *)message
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Oops!" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}


#pragma mark - Keyboard Dismiss Control
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
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
