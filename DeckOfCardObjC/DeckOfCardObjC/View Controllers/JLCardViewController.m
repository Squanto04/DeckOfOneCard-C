//
//  JLCardViewController.m
//  DeckOfCardObjC
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//
//
//#import "JLCardViewController.h"
//#import "JLCardController.h"
//#import "JLCard.h"
//
//@interface JLCardViewController ()
//
//@end
//
//@implementation JLCardViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//}
//
//- (IBAction)DrawNewButtonTapped:(UIButton *)sender {
//    [JLCardController.sharedController drawNewCard:1 completion:^(NSArray<JLCard *> * cardArray) {
//        [JLCardController.sharedController fetchImageFromCard:cardArray[0] completion:^(UIImage * image) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.cardImageView.image = image;
//                JLCard * card = cardArray[0];
//                self.suitLabel.text = card.suit;
//            });
//        }];
//    }];
//}
//@end
