//
//  FeedComponent.h
//  TopFeed
//
//  Created by Max Rovnov on 13.07.15.
//  Copyright (c) 2015 Max Rovnov. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>

#import "Feed.h"

@interface FeedComponent : CKCompositeComponent

+ (instancetype)newWithFeed:(Feed *)feed;

@end
