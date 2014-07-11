//
//  Presentation.h
//  makeColor
//
//  Created by Marcelo Sampaio on 7/11/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Presentation : NSObject

@property (nonatomic,strong) NSString *name;
@property float transitionTime;
@property (nonatomic,strong) NSString *transitionAudio;


-(id)initWithName:(NSString *)mName transitionTime:(float)mTransitionTime transitionAudio:(NSString *)mTransitionAudio;

@end
