//
//  DMACard.m
//  DeckOfCardObjC
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLCard.h"

@implementation JLCard

- (instancetype)initWithCardSuit:(NSString *)suit image:(NSString *)image
{
    self = [super init];
    if (self)
    {
        _suit = suit;
        _image = image;
    }
    return self;
}

@end

@implementation JLCard (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * suit = dictionary[@"suit"];
    NSString * image = dictionary[@"image"];
    
    return [self initWithCardSuit:suit image:image];
}

@end
