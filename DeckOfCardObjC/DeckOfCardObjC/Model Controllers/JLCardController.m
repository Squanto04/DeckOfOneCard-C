//
//  JLCardController.m
//  DeckOfCardObjC
//
//  Created by Jordan Lamb on 10/7/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

#import "JLCardController.h"

@implementation JLCardController

+ (JLCardController *)sharedController
{
    static JLCardController * sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [JLCardController new];
    });
    return sharedController;
}

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new";

+ (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<JLCard *> *))completion
{
    NSURL * url = [NSURL URLWithString:baseURLString];
    NSString * cardCount = [@(numberOfCards) stringValue];
    NSURL * drawURL = [url URLByAppendingPathComponent:@"draw/"];
    
    NSURLComponents * urlComponents = [NSURLComponents
                                       componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem * queryItem = [NSURLQueryItem queryItemWithName:@"count" value: cardCount];
    
    urlComponents.queryItems = @[queryItem];
    NSURL * finalURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL: finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error)
            {
                NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            }
            if (response)
            {
                NSLog(@"%@", response);
            }
            if (data)
            {
                NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
                if (!topLevelDictionary)
                {
                    NSLog(@"Error parsing the JSON %@", error);
                    completion(nil);
                    return;
                }
                NSArray * cardsArray = topLevelDictionary[@"cards"];
                NSMutableArray * cardPlaceholder = [NSMutableArray new];
                
                for (NSDictionary * dictionary in cardsArray)
                {
                    JLCard * card = [[JLCard alloc] initWithDictionary:dictionary];
                    [cardPlaceholder addObject: card];
                }
                completion(cardPlaceholder);
            }
        }]resume];
}

+ (void)fetchImageFromCard:(JLCard *)card completion:(void (^)(UIImage *))completion
{
    NSURL * imageURL = [NSURL URLWithString:card.image];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"Error: %@, %@", error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (response)
        {
            NSLog(@"%@", response);
        }
        if (data)
        {
            UIImage * image = [UIImage imageWithData:data];
            completion(image);
        }
    }] resume];
}

@end
