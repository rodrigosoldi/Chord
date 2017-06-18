//
//  Posicao+CoreDataProperties.h
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 07/05/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

#import "Posicao+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Posicao (CoreDataProperties)

+ (NSFetchRequest<Posicao *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *p1;
@property (nullable, nonatomic, copy) NSString *p2;
@property (nullable, nonatomic, copy) NSString *p3;
@property (nullable, nonatomic, copy) NSString *p4;
@property (nullable, nonatomic, copy) NSString *p5;
@property (nullable, nonatomic, copy) NSString *p6;
@property (nullable, nonatomic, retain) Nota *nota;
@property (nullable, nonatomic, retain) Nota *notaPadrao;

@end

NS_ASSUME_NONNULL_END
