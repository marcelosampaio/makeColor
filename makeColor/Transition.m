//
//  Transition.m
//  makeColor
//
//  Created by Marcelo Sampaio on 7/12/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Transition.h"

@implementation Transition

@synthesize red,green,blue,rowId;

-(id)initWithRed:(float)mRed green:(float)mGreen blue:(float)mBlue rowId:(int)mRowId
{
    self=[super init];
    
    if (self) {
        red=mRed;
        green=mGreen;
        blue=mBlue;
        rowId=mRowId;
    }
    return self;
}


@end
