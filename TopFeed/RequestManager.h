//
//  RequestManager.h
//  TopFeed
//
//  Created by Max Rovnov on 13.07.15.
//  Copyright (c) 2015 Max Rovnov. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Feed.h"

@interface RequestManager : NSObject

- (void)requestFeed:(Feed *)feed withCompletionHandler:(void(^)(NSArray *feedItems))completionHandler; 

@end
