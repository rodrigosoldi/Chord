//
//  Posicao+CoreDataProperties.m
//  Chords
//
//  Created by Rodrigo Soldi Lopes on 07/05/17.
//  Copyright © 2017 Rodrigo Soldi Lopes. All rights reserved.
//

#import "Posicao+CoreDataProperties.h"

@implementation Posicao (CoreDataProperties)

+ (NSFetchRequest<Posicao *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Posicao"];
}

@dynamic p1;
@dynamic p2;
@dynamic p3;
@dynamic p4;
@dynamic p5;
@dynamic p6;
@dynamic nota;
@dynamic notaPadrao;

@end
