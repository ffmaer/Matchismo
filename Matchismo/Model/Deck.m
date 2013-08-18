//
//  Deck.m
//  Matchismo
//
//  Created by tcz on 8/13/13.
//  Copyright (c) 2013 Maer Studios Inc. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

-(NSMutableArray *) cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(id)card atTop:(BOOL)atTop
{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }
    else
    {
        [self.cards addObject:card];
    }
}

-(PlayingCard *)drawRandomCard
{
    PlayingCard *randomCard = nil;
    if(self.cards.count){
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex: index];
    }
    return randomCard;
}

@end