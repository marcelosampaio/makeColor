//
//  Presentation.m
//  makeColor
//
//  Created by Marcelo Sampaio on 7/11/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Presentation.h"

@implementation Presentation

@synthesize name,transitionTime,transitionAudio;


-(id)initWithName:(NSString *)mName transitionTime:(float)mTransitionTime transitionAudio:(NSString *)mTransitionAudio
{
    self=[super init];
    if (self) {
        name=mName;
        transitionTime=mTransitionTime;
        transitionAudio=mTransitionAudio;
    }    
    return self;
}



@end
