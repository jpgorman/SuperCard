//
//  ViewController.m
//  SuperCard
//
//  Created by Jean-Paul Gorman on 01/10/2016.
//  Copyright (c) 2016 Jean-Paul Gorman. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(PlayingCardView) NSArray *playingCardViews;

@property (strong, nonatomic) Deck *deck;
@end

@implementation ViewController

- (Deck *)deck
{
    if(!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (PlayingCard *)drawRandomPlayingCard
{
    Card *card = [self.deck drawRandomCard];
    PlayingCard *playingcard = (PlayingCard *)card;
    return playingcard;
}

- (void)tap:(UITapGestureRecognizer *)sender
{
    
    if ((sender.state == UIGestureRecognizerStateEnded)) {
  
        if([sender.view isKindOfClass:[PlayingCardView class]])
        {
            NSUInteger index = [self.playingCardViews indexOfObject:sender.view];
            PlayingCardView *playingCardView = [self.playingCardViews objectAtIndex:index];
            playingCardView.faceUp = !playingCardView.faceUp;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    for (PlayingCardView *playingCardView in self.playingCardViews) {
        
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        
        PlayingCard *playingCard = [self drawRandomPlayingCard];
        playingCardView.suit = playingCard.suit;
        playingCardView.rank = playingCard.rank;
        playingCardView.faceUp = YES;
        [playingCardView addGestureRecognizer:tapGestureRecognizer];
    }
    
}

@end
