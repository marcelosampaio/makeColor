//
//  CustomTableViewCell.m
//  makeColor
//
//  Created by Marcelo Sampaio on 7/14/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell
@synthesize imageView;
@synthesize redLabel;
@synthesize greenLabel;
@synthesize blueLabel;


#pragma mark - View Initialization
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
