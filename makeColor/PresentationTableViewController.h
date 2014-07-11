//
//  PresentationTableViewController.h
//  makeColor
//
//  Created by Marcelo Sampaio on 7/11/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"

@interface PresentationTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addOutlet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *actionOutlet;




@property (nonatomic,strong) NSMutableArray *presentations;

// Database property
@property (nonatomic,strong) Database *database;

@end
