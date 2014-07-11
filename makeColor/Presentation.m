//
//  Presentation.m
//  makeColor
//
//  Created by Marcelo Sampaio on 7/11/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Presentation.h"

@implementation Presentation

@synthesize name,transitionTime,transitionAudio,rowId;


-(id)initWithName:(NSString *)mName transitionTime:(float)mTransitionTime transitionAudio:(NSString *)mTransitionAudio rowId:(int)mRowId
{
    self=[super init];
    if (self) {
        name=mName;
        transitionTime=mTransitionTime;
        transitionAudio=mTransitionAudio;
        rowId=mRowId;
    }    
    return self;
}



@end
