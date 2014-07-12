//
//  Transition.h
//  makeColor
//
//  Created by Marcelo Sampaio on 7/12/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transition : NSObject

@property float red;
@property float green;
@property float blue;
@property int rowId;


-(id)initWithRed:(float)mRed green:(float)mGreen blue:(float)mBlue rowId:(int)mRowId;



@end
