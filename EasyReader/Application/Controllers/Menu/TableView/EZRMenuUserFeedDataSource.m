//
//  CSMenuUserFeedDataSource.m
//  EasyReader
//
//  Created by Michael Beattie on 3/20/14.
//  Copyright (c) 2014 Cloudspace. All rights reserved.
//

#import "EZRMenuUserFeedDataSource.h"
#import "EZRMenuFeedCell.h"

#import "Feed.h"
#import "FeedItem.h"
#import "User.h"

#import "UIColor+EZRSharedColorAdditions.h"
#import "NSSet+CSSortingAdditions.h"
#import "EZRCurrentFeedsProvider.h"
#import <Block-KVO/MTKObserving.h>
#import "EZRGoogleAnalyticsService.h"

@interface EZRMenuUserFeedDataSource ()

/// The menu table view
@property (nonatomic, weak) IBOutlet UITableView *tableView;

/// A proxy object containing the current user
@property (nonatomic, weak) IBOutlet EZRCurrentFeedsProvider *currentFeedsProvider;


@end


@implementation EZRMenuUserFeedDataSource

- (instancetype) init{
    self = [super init];
    self.currentFeedsProvider = [EZRCurrentFeedsProvider shared];
    
    if (self) {
        self.configureCell = ^(UITableViewCell *cell, Feed *feed) {
            ((EZRMenuFeedCell *)cell).feed = feed;
        };
        
        self.reusableCellIdentifier = @"UserFeedCell";
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [super tableView:tableView numberOfRowsInSection:section] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:self.reusableCellIdentifier];;
        ((EZRMenuFeedCell*)cell).feed = nil;
        ((EZRMenuFeedCell*)cell).label_name.text = @"All Feeds";
        cell.backgroundColor = [UIColor clearColor];
        if (self.currentFeedsProvider.currentFeed == nil) {
            cell.selected = YES;
        }
    } else {
        NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section];
        cell = [super tableView:tableView cellForRowAtIndexPath:previousIndexPath];

        if (self.source[indexPath.row-1] == self.currentFeedsProvider.currentFeed) {
            cell.selected = YES;
        }
    }
    
    cell.backgroundColor = [UIColor clearColor];

    return cell;
}

/**
 * Commits each editing action
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Feed *toDelete = [self.source objectAtIndex:indexPath.row-1];
        [[EZRGoogleAnalyticsService shared] sendView:@"Feed Removed"];
        [[User current] removeFeedsObject:toDelete];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        [self.tableView reloadData];
    }
}


@end