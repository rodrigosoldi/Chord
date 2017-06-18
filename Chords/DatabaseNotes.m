//
//  DatabaseNotes.m
//  Cifrando
//
//  Created by Rodrigo Soldi Lopes on 26/05/15.
//  Copyright (c) 2015 Cifrando Inc. All rights reserved.
//

#import "DatabaseNotes.h"
#import "Nota+CoreDataClass.h"
#define HOME_DIRECTORY NSHomeDirectory()
#define DOCUMENTS_DIRECTORY [HOME_DIRECTORY stringByAppendingPathComponent:@"Documents"]

@implementation DatabaseNotes

#pragma mark - Database Methods

-(void)allNotes:(void (^)(NSArray *, BOOL))completion
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Nota"];
        NSError *error;
        
        NSArray *notes = [[self managedObjectContext] executeFetchRequest: request error:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (notes.count != 0 && notes) {
                if (completion)
                    completion(notes, YES);
            }else{
                if (completion)
                    completion(nil, NO);
            }
            
        });
    });
}

-(Nota *)noteByName:(NSString *)name
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Nota"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nome =[c] %@", name];
    request.predicate = predicate;
    NSError *error;
    
    NSArray *notes = [[self managedObjectContext] executeFetchRequest: request error:&error];
    
    if (notes && notes.count != 0) {
        Nota *nota = (Nota *)notes[0];
        return nota;
    }
    
    return nil;
}

-(void)notesByName:(NSString *)name andBlock:(void (^)(NSArray *, BOOL))completion
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Nota"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nome beginswith[c] %@", name];
    request.predicate = predicate;
    NSError *error;
    
    NSArray *notes = [[self managedObjectContext] executeFetchRequest: request error:&error];
    
    if (notes.count != 0 && notes){
        completion(notes, YES);
        return;
    }
    
    completion(nil, NO);
}


#pragma mark - Singleton Methods

static DatabaseNotes *SINGLETON = nil;

static bool isFirstAccess = YES;

+ (DatabaseNotes *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[DatabaseNotes alloc] init];
}

- (id)mutableCopy
{
    return [[DatabaseNotes alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Rodrigo-Soldi.CreateNotes" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CifrandoChords" withExtension:@"mom"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];

    NSURL *storeURL;
    if (![self hasDirectoryWithName:[DOCUMENTS_DIRECTORY stringByAppendingString:@"/CifrandoChords.sqlite"]]){
        NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CifrandoChords" ofType:@"sqlite"]];
        [[NSFileManager defaultManager] createFileAtPath: [DOCUMENTS_DIRECTORY stringByAppendingString:@"/CifrandoChords.sqlite"] contents:data attributes:nil];
        storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CifrandoChords.sqlite"];
        
    }else
        storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CifrandoChords.sqlite"];

    
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

-(BOOL)hasDirectoryWithName:(NSString *)directoryName
{
    return [[NSFileManager defaultManager] fileExistsAtPath:directoryName];
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


@end
