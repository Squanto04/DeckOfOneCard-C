//
//  DMACard.h
//  DeckOfCardObjC
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JLCard : NSObject

@property (nonatomic, copy, readonly) NSString * suit;
@property (nonatomic, copy, readonly) NSString * image;

- (instancetype)initWithCardSuit:(NSString *) suit
                           image:(NSString *) image;

@end

@interface JLCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString * , id> * )dictionary;
@end

NS_ASSUME_NONNULL_END
