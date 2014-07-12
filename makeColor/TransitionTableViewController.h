//
//  TransitionTableViewController.h
//  makeColor
//
//  Created by Marcelo Sampaio on 7/12/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"


@interface TransitionTableViewController : UITableViewController



@property (nonatomic,strong) NSMutableArray *transitions;




// Database property
@property (nonatomic,strong) Database *database;
@end
