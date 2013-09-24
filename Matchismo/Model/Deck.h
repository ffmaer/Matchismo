//
//  Deck.h
//  Matchismo
//
//  Created by tcz on 8/13/13.
//  Copyright (c) 2013 Maer Studios Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;

@end
