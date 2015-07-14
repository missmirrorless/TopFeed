//
//  FeedComponent.m
//  TopFeed
//
//  Created by Max Rovnov on 13.07.15.
//  Copyright (c) 2015 Max Rovnov. All rights reserved.
//

#import "FeedComponent.h"

@implementation FeedComponent

+ (instancetype)newWithFeed:(Feed *)feed {
    return [super newWithComponent:
            [CKStackLayoutComponent newWithView:{}
                                           size:{.height = 44.0}
                                          style:{}
                                       children:{
                                           {
                                               [CKLabelComponent newWithLabelAttributes:{.string = feed.name} viewAttributes:{}]
                                           }
                                       }]];
}

@end
