//
//  DatabaseNotes.h
//  Cifrando
//
//  Created by Rodrigo Soldi Lopes on 26/05/15.
//  Copyright (c) 2015 Cifrando Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Nota;

@interface DatabaseNotes : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+(DatabaseNotes *)sharedInstance;

- (void)saveContext;

-(Nota *)noteByName: (NSString *)name;
-(void)notesByName: (NSString *)name andBlock: (void (^)(NSArray *notes, BOOL success))completion;

-(void)allNotes: (void(^)(NSArray *allNotes, BOOL success))completion;

@end
