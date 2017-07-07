//
//  UIViewController+MJRefresh.h
//  CJ_MJRefresh
//
//  Created by 侯春娇 on 2017/7/5.
//  Copyright © 2017年 侯春娇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MJRefresh)


- (void) startRefreshWithUITableView:(UIScrollView *)scrollView andHeader:(void(^)())header;

- (void) endRefreshing;
@end
