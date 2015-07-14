//
//  FeedListViewController.m
//  TopFeed
//
//  Created by Max Rovnov on 13.07.15.
//  Copyright (c) 2015 Max Rovnov. All rights reserved.
//

#import "FeedListViewController.h"

#import <ComponentKit/ComponentKit.h>

#import "Feed.h"
#import "FeedPage.h"
#import "FeedComponent.h"

@interface FeedListViewController () <CKComponentProvider, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) CKCollectionViewDataSource *dataSource;
@property (strong, nonatomic) CKComponentFlexibleSizeRangeProvider *sizeRangeProvider;

@end

@implementation FeedListViewController

#pragma mark - intialization
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithCollectionViewLayout:layout];
    
    if (self) {
        self.sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight];
    }
    
    return self;
}

#pragma mark - lifecycle 
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    
    self.dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:self.collectionView
                                                     supplementaryViewDataSource:nil
                                                               componentProvider:[self class]
                                                                         context:nil
                                                       cellConfigurationFunction:nil];
    
    CKArrayControllerSections sections;
    sections.insert(0);
    [self.dataSource enqueueChangeset:{sections, {}} constrainedSize:{}];
    
    NSArray *feedList = [self generateFeedList];

    CKArrayControllerInputItems items;
    for (NSInteger index = 0; index < feedList.count; index++) {
        items.insert([NSIndexPath indexPathForRow:index inSection:0], feedList[index]);
    }
    
    [self.dataSource enqueueChangeset:{{}, items} constrainedSize:[self.sizeRangeProvider sizeRangeForBoundingSize:self.collectionView.bounds.size]];
}

#pragma mark - private
- (NSArray *)generateFeedList {
    NSMutableArray *list = [NSMutableArray array];
    [list addObject:[Feed feedWithKey:@"newapplications" andName:@"New Applications"]];
    [list addObject:[Feed feedWithKey:@"newfreeapplications" andName:@"New Free Applications"]];
    [list addObject:[Feed feedWithKey:@"newpaidapplications" andName:@"New Paid Applications"]];
    [list addObject:[Feed feedWithKey:@"topfreeapplications" andName:@"Top Free Applications"]];
    [list addObject:[Feed feedWithKey:@"topfreeipadapplications" andName:@"Top Free iPad Applications"]];
    [list addObject:[Feed feedWithKey:@"topgrossingapplications" andName:@"Top Grossing Applications"]];
    [list addObject:[Feed feedWithKey:@"topgrossingipadapplications" andName:@"Top Grossing iPad Applications"]];
    [list addObject:[Feed feedWithKey:@"toppaidapplications" andName:@"Top Paid Applications"]];
    [list addObject:[Feed feedWithKey:@"toppaidipadapplications" andName:@"Top Paid iPad Applications"]];
    
    return list;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSource sizeForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataSource announceWillAppearForItemInCell:cell];
}

- (void)collectionView:(UICollectionView *)collectionView
  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.dataSource announceDidDisappearForItemInCell:cell];
}

#pragma mark - CKComponentProvider
+ (CKComponent *)componentForModel:(Feed *)model context:(id<NSObject>)context {
    return [FeedComponent newWithFeed:model];
}

@end
