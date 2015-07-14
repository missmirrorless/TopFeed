//
//  Feed.h
//  TopFeed
//
//  Created by Max Rovnov on 13.07.15.
//  Copyright (c) 2015 Max Rovnov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *key;

- (instancetype)initWithKey:(NSString *)key andName:(NSString *)name;
+ (instancetype)feedWithKey:(NSString *)key andName:(NSString *)name;


@end
