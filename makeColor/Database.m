//
//  Database.m
//  makeColor
//
//  Created by Marcelo Sampaio on 7/11/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Database.h"
#import "Presentation.h"

#define DATABASE_NAME @"makeColor.db"

@implementation Database

@synthesize database;

#pragma mark - Database Methods
-(NSString *) dbPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingPathComponent:DATABASE_NAME];
}


-(void) openDB
{
    if (sqlite3_open([[self dbPath] UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSAssert(0,@"Open database failure!");
        return;
    }
}

-(void) closeDB
{
    sqlite3_close(db);
}

-(void) copyDatabaseToWritableFolder
{
    // Testa a existência de cópia editavel
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:DATABASE_NAME];
    
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (success)
    {
        return;
    }
    
    
    // The writable database does not exist, so copy the default to the appropriate location.
    NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DATABASE_NAME];

    success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (!success) {
        NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
    }
}

#pragma mark - Presentation Methods
-(void)addPresentantionWithName:(NSString *)presentation transitionTime:(float)transitionTime transitionAudio:(NSString *)transitonAudio
{
    // check is movie title is already saved in database
    if ([self presentationExistsWithName:presentation]) {
        return;
    }
    
    // error variable for database call
    char *err;
    
    // sql string
    NSString *sql=[NSString stringWithFormat:@"insert into presentation (presentation,transitionTime,transitionAudio) values ('%@',%f,'%@')",presentation,transitionTime,transitonAudio];

    // execute database command
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK) {
        [self closeDB];
        NSAssert(0, @"Database error - addPresentation Method error=%s",err);
    }
}


-(BOOL)presentationExistsWithName:(NSString *)name
{
    // sql string
    NSString *sql=[NSString stringWithFormat:@"select * from presentation where presentation='%@'",name];
    
    // access database
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            return YES;
        }
    }
    
    return NO;
}

-(NSMutableArray *) getPresentations
{
    NSMutableArray *objectArray=[[NSMutableArray alloc]init];
    
    // Get favorites from database
    NSString *sql = [NSString stringWithFormat:@"select * from presentation order by presentation"];
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil)==SQLITE_OK)
    {
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            // presentation name
            char *field1 = (char *) sqlite3_column_text(statement, 0);
            NSString *name = [[NSString alloc] initWithUTF8String:field1];
            
            // transition time
            char *field2 = (char *) sqlite3_column_text(statement, 1);
            NSString *transitionTime = [[NSString alloc] initWithUTF8String:field2];
            
            // transition audio
            char *field3 = (char *) sqlite3_column_text(statement, 2);
            NSString *transitionAudio = [[NSString alloc] initWithUTF8String:field3];
 
            [objectArray addObject:[[Presentation alloc]initWithName:name transitionTime:[transitionTime floatValue] transitionAudio:transitionAudio]];

        }
    }
    return objectArray;

}

@end
