//
//  PlayingCard.h
//  Matchismo
//
//  Created by tcz on 8/14/13.
//  Copyright (c) 2013 Maer Studios Inc. All rights reserved.
//


#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;
+(NSArray *)validSuits;
+(NSInteger)maxRank;
+(NSInteger) match: (NSMutableArray *)cards;
@end
