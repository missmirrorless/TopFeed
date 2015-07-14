//
//  Feed.m
//  TopFeed
//
//  Created by Max Rovnov on 13.07.15.
//  Copyright (c) 2015 Max Rovnov. All rights reserved.
//

#import "Feed.h"

@implementation Feed

#pragma mark - intialization
- (instancetype)initWithKey:(NSString *)key andName:(NSString *)name {
    self = [super init];
    
    if (self) {
        self.key = key;
        self.name = name;
    }
    
    return self;
}

+ (instancetype)feedWithKey:(NSString *)key andName:(NSString *)name {
    Feed *item = [[Feed alloc] initWithKey:key andName:name];
    return item;
}



@end
