//
//  Nota+CoreDataProperties.m
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 07/05/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

#import "Nota+CoreDataProperties.h"

@implementation Nota (CoreDataProperties)

+ (NSFetchRequest<Nota *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Nota"];
}

@dynamic descricao;
@dynamic nome;
@dynamic posicaoPadrao;
@dynamic posicoes;

@end
