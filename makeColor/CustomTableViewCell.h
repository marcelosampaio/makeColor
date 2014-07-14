//
//  CustomTableViewCell.h
//  makeColor
//
//  Created by Marcelo Sampaio on 7/14/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;


@end
