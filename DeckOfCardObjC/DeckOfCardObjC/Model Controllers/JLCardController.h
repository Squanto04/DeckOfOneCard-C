//
//  JLCardController.h
//  DeckOfCardObjC
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JLCard.h"

@interface JLCardController : NSObject

+ (JLCardController *)sharedController;

+ (void)drawNewCard:(NSInteger)numberOfCards completion: (void (^) (NSArray <JLCard *> *))completion;

+ (void)fetchImageFromCard:(JLCard *)card completion:(void(^) (UIImage *))completion;

@end
