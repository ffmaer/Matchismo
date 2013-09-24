//
//  TheMatchingGame.h
//  Matchismo
//
//  Created by tcz on 8/18/13.
//  Copyright (c) 2013 Maer Studios Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface TheMatchingGame : NSObject


-(id)initWithCardCount: (NSUInteger) count usingDeck:(Deck *)deck;
-(Card* )cardAtIndex: (NSUInteger) index;
-(NSString *) flipCardAtIndex:(NSUInteger) index;
@property (nonatomic) NSUInteger mode;
@property (readonly,nonatomic) NSInteger score;
@end
