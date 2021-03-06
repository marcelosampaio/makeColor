//
//  Database.h
//  makeColor
//
//  Created by Marcelo Sampaio on 7/11/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface Database : NSObject
{
    sqlite3 *db;
}

@property (nonatomic,strong) Database *database;

#pragma mark - Database Methods
-(void) openDB;
-(void) closeDB;
-(void) copyDatabaseToWritableFolder;

#pragma mark - Presentation Methods
-(BOOL)presentationExistsWithName:(NSString *)name;
-(void)addPresentantionWithName:(NSString *)presentation transitionTime:(float)transitionTime transitionAudio:(NSString *)transitonAudio;
-(NSMutableArray *) getPresentations;
-(void)removePresententionWithRowId:(int)rowId;
-(void)removeTransitionWithPresentationId:(int)presentationId;

#pragma mark - Transition Methods
-(NSMutableArray *) getTransitions;
-(void) addTransitionWithRed:(float)red green:(float)green blue:(float)blue;
-(void) updateTransitionWithRowId:(int)rowId red:(float)red green:(float)green blue:(float)blue;
-(void) removeTransitionWithRowId:(int)rowId;

@end
