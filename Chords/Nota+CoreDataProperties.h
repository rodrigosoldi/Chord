//
//  Nota+CoreDataProperties.h
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 07/05/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

#import "Nota+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Nota (CoreDataProperties)

+ (NSFetchRequest<Nota *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *descricao;
@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, retain) Posicao *posicaoPadrao;
@property (nullable, nonatomic, retain) NSSet<Posicao *> *posicoes;

@end

@interface Nota (CoreDataGeneratedAccessors)

- (void)addPosicoesObject:(Posicao *)value;
- (void)removePosicoesObject:(Posicao *)value;
- (void)addPosicoes:(NSSet<Posicao *> *)values;
- (void)removePosicoes:(NSSet<Posicao *> *)values;

@end

NS_ASSUME_NONNULL_END
