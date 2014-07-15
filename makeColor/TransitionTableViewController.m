//
//  TransitionTableViewController.m
//  makeColor
//
//  Created by Marcelo Sampaio on 7/12/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "TransitionTableViewController.h"
#import "Transition.h"
#import "AddTransitionViewController.h"
#import "CustomTableViewCell.h"

@interface TransitionTableViewController ()

@end

@implementation TransitionTableViewController

@synthesize playOutlet;
@synthesize transitions;
@synthesize database;



#pragma mark - View Initialization
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

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Open DB
    [self.database openDB];
    // load source
    [self loadTransitions];
    if (self.transitions.count<=1) {
        self.playOutlet.enabled=NO;
    }else{
        self.playOutlet.enabled=YES;
    }

}

#pragma mark - Working Methods
-(void)loadTransitions {
    self.transitions=[self.database getTransitions];
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.transitions count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    static NSString *simpleTableIdentifier = @"customCell";
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell==nil)  //Instancia celulas suficientes para uma tela
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    
    // Configure the cell...

    Transition *transition=[self.transitions objectAtIndex:indexPath.row];
    cell.imageView.backgroundColor=[UIColor colorWithRed:transition.red green:transition.green blue:transition.blue alpha:1];
    cell.redLabel.text=[NSString stringWithFormat:@"%f",transition.red];
    cell.greenLabel.text=[NSString stringWithFormat:@"%f",transition.green];
    cell.blueLabel.text=[NSString stringWithFormat:@"%f",transition.blue];
    
    return cell;
}

// custom cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}
// row edit
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// remove row
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath: (NSIndexPath *)indexPath {
    return @"Remove";
    //    [self.tableView setEditing:!self.tableView.editing animated:YES];
}
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {

        // delete from database
        Transition *transition=[self.transitions objectAtIndex:indexPath.row];
        [self.database removeTransitionWithRowId:transition.rowId];
        
        // remove from source array
        [self.transitions removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"editTransition" sender:self];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AddTransitionViewController *addTransitionViewController;
    addTransitionViewController=segue.destinationViewController;
    NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
    
    Transition *transition=[[Transition alloc]init];
    if (self.transitions.count>0) {
        transition=[self.transitions objectAtIndex:indexPath.row];
    }
    if ([[segue identifier]isEqualToString:@"playTransitions"]) {
  
    } else if ([[segue identifier]isEqualToString:@"addTransition"]) {
        [addTransitionViewController setSegueAction:@"ADD"];
    } else if ([[segue identifier]isEqualToString:@"editTransition"]) {
        [addTransitionViewController setSegueAction:@"EDIT"];
        [addTransitionViewController setTransition:transition];
    }
    
    
}


@end
