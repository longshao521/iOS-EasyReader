//
//  CSFeedCollectionViewController.h
//  EasyReader
//
//  Created by Joseph Lorich on 3/13/14.
//  Copyright (c) 2014 Cloudspace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSBaseViewController.h"

@class User;

@interface CSHomeViewController : CSBaseViewController<UICollectionViewDelegate,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *verticalScrollView;
@property (strong, nonatomic) IBOutlet UIButton *button_leftMenu;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl_itemIndicator;
@property (nonatomic, strong) UIWebView *feedItemWebView;
@property (nonatomic, strong) NSMutableSet *feedItems;
@property User* currentUser;

@property int collectionCellGoingTo;

@end
