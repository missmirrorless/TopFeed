//
//  FeedPage.m
//  TopFeed
//
//  Created by Max Rovnov on 13.07.15.
//  Copyright (c) 2015 Max Rovnov. All rights reserved.
//

#import "FeedPage.h"

@implementation FeedPage

#pragma mark - initialization
- (instancetype)initWithItems:(NSArray *)items andPosition:(NSUInteger)position {
    self = [super init];
    
    if (self) {
        self.items = items;
        self.position = position;
    }
    
    return self;
}

+ (instancetype)feedPageWithItems:(NSArray *)items andPosition:(NSUInteger)position {
    FeedPage *page = [[FeedPage alloc] initWithItems:items andPosition:position];
    return page;
}

@end
