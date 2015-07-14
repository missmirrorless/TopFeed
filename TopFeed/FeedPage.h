//
//  FeedPage.h
//  TopFeed
//
//  Created by Max Rovnov on 13.07.15.
//  Copyright (c) 2015 Max Rovnov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedPage : NSObject

@property (strong, nonatomic) NSArray *items;
@property (readwrite, nonatomic) NSInteger position;

- (instancetype)initWithItems:(NSArray *)items andPosition:(NSUInteger)position;
+ (instancetype)feedPageWithItems:(NSArray *)items andPosition:(NSUInteger)position;

@end
