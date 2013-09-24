//
//  PlayingCard.m
//  Matchismo
//
//  Created by tcz on 8/14/13.
//  Copyright (c) 2013 Maer Studios Inc. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *) contents {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit =_suit;

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (NSString *) suit{
    return _suit ? _suit :@"?";
}

- (void) setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

+ (NSArray *) rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSInteger) maxRank
{
    return [self rankStrings].count -1 ;
}

- (void)setRank:(NSInteger)rank
{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}
#define SUIT_MATCH_SCORE 4;
#define RANK_MATCH_SCORE 16;
#define NOT_MATCH_SCORE -2;

+(NSInteger) match: (NSMutableArray *)cards{
    NSInteger score = NOT_MATCH_SCORE;
    BOOL matchSuit=YES;
    BOOL matchRank=YES;
    PlayingCard *firstCard = cards[0];
    for(PlayingCard *card in cards){
        if(![firstCard.suit isEqualToString:card.suit]){
            matchSuit = NO;
        }
        if(firstCard.rank != card.rank){
            matchRank = NO;
        }
    }
    if(matchSuit){
        score = SUIT_MATCH_SCORE;
    }else if (matchRank){
        score = RANK_MATCH_SCORE;
    }
    return score;
}
@end