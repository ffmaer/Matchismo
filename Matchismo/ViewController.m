//
//  ViewController.m
//  Matchismo
//
//  Created by tcz on 8/10/13.
//  Copyright (c) 2013 Maer Studios Inc. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "TheMatchingGame.h"

@interface ViewController ()
@property (nonatomic) int flipsCount;
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mode;
@property (strong, nonatomic)NSMutableArray *history;
@property (weak, nonatomic) IBOutlet UISlider *historySlider;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (strong,nonatomic) TheMatchingGame *game;
@property (strong,nonatomic) Deck* deck;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

-(Deck *)deck{
    if(!_deck) _deck = [[PlayingCardDeck alloc ]init];
    return _deck;
}

-(TheMatchingGame *)game{
    if(!_game) _game = [[TheMatchingGame alloc] initWithCardCount:self.buttons.count
                                                        usingDeck:(Deck *)self.deck];
    return _game;
}

-(void)updateUI{
    for(int i=0;i<[self.buttons count];i++){
        Card *card = [self.game cardAtIndex:i];
        UIButton *button = self.buttons[i];
        button.enabled = YES;
        button.selected = NO;
        if(card.unplayable){
            button.enabled = NO;
            [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
            [button setTitle:card.contents forState:UIControlStateDisabled];
            button.alpha = 0.7;
        }else{
            button.selected = card.faceUp;
            [button setTitle:card.contents forState:UIControlStateSelected];
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
}

-(NSMutableArray *)history{
    if(!_history) _history = [[NSMutableArray alloc] init];
    return _history;
}

-(void) setFlipsCount:(int)flipsCount
{
    _flipsCount = flipsCount;   
    self.flipLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipsCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    self.matchLabel.alpha=1;
    self.historySlider.enabled = YES;
    self.mode.enabled = NO;
    self.flipsCount++;
    self.game.mode = self.mode.selectedSegmentIndex+2;
    //the line below is important
    NSString *message = [self.game flipCardAtIndex:[self.buttons indexOfObject:sender]];
    self.matchLabel.text = message;
    [self updateUI];
    // update history
    [self.history addObject:message];
    self.historySlider.minimumValue=0;
    self.historySlider.maximumValue=self.history.count-1;
}

- (void)resetHistory{
    self.history = nil;
    self.historySlider.minimumValue=0;
    self.historySlider.maximumValue=0;
    self.historySlider.enabled = NO;

}

- (IBAction)reset:(id)sender {
    
    [self resetHistory];
    
    self.matchLabel.text = @"";
    self.mode.enabled = YES;
    
    self.flipsCount = 0;
    
    self.deck = [[PlayingCardDeck alloc ]init];
    self.game = [[TheMatchingGame alloc] initWithCardCount:self.buttons.count
                                             usingDeck:(Deck *)self.deck];
    
    [self updateUI];
    
}
- (IBAction)slide:(UISlider *)sender {
    
    NSString *message = self.history[(int)sender.value];
    self.matchLabel.text = message;
    self.matchLabel.alpha = 0.5;
}


@end
