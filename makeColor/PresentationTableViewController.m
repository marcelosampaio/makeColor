//
//  PresentationTableViewController.m
//  makeColor
//
//  Created by Marcelo Sampaio on 7/11/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "PresentationTableViewController.h"
#import "Presentation.h"
#import "AddPresentationViewController.h"

@interface PresentationTableViewController ()

@end

@implementation PresentationTableViewController

@synthesize addOutlet,actionOutlet;
@synthesize database;
@synthesize presentations;

#pragma mark - Initialization
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.database=[[Database alloc]init];
    
    // Copy database to documents folder
    [self.database copyDatabaseToWritableFolder];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Open DB
    [self.database openDB];
    // load source
    [self loadSource];

}


#pragma mark - Working Methods
-(void)loadSource
{
    self.presentations=[self.database getPresentations];
    [self.tableView reloadData];
}

#pragma mark - UI Actions
- (IBAction)addPresentation:(id)sender {
    
}

- (IBAction)action:(id)sender {
}



#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.presentations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier];
    }
    
    
    // Configure the cell..
    Presentation *presentation=[self.presentations objectAtIndex:indexPath.row];

    // Format transitionTime
    NSNumber *time=[NSNumber numberWithFloat:presentation.transitionTime];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.roundingIncrement = [NSNumber numberWithDouble:0.01];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    
    cell.textLabel.text=presentation.name;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@s",[formatter stringFromNumber:time]];
    
    return cell;
}

#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AddPresentationViewController *addPresentationViewController;
    addPresentationViewController=segue.destinationViewController;
    NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
    
    if ([[segue identifier]isEqualToString:@"addPresentation"]) {
        [addPresentationViewController setSegueParameter:@"ADD"];
    } else if ([[segue identifier]isEqualToString:@"editPresentation"]) {
        [addPresentationViewController setSegueParameter:@"EDIT"];
        Presentation *presentation=[self.presentations objectAtIndex:indexPath.row];
        [addPresentationViewController setSegueName:presentation.name];
        [addPresentationViewController setSegueValue:presentation.transitionTime];
    }
    
    
}

@end
