//
//  UIViewController+MJRefresh.m
//  CJ_MJRefresh
//
//  Created by 侯春娇 on 2017/7/5.
//  Copyright © 2017年 侯春娇. All rights reserved.
//

#import "UIViewController+MJRefresh.h"
#import "MJRefreshGifHeaderRewrite.h"
#import "UIViewController_MJRefresh.h"

@implementation UIViewController (MJRefresh)

- (void)startRefreshWithUITableView:(UIScrollView *)scrollView andHeader:(void (^)())header{
    if (![scrollView isKindOfClass:[UITableView class]])return;
    
    self.tableview = (UITableView *)scrollView;
    
    NSArray *idleImgs = [NSArray arrayWithObjects:[UIImage imageNamed:@"下拉加载_动效00"],[UIImage imageNamed:@"下拉加载_动效01"],[UIImage imageNamed:@"下拉加载_动效02"],[UIImage imageNamed:@"下拉加载_动效03"],[UIImage imageNamed:@"下拉加载_动效04"],[UIImage imageNamed:@"下拉加载_动效05"],[UIImage imageNamed:@"下拉加载_动效06"],nil];
    NSArray *pullingImgs = [NSArray arrayWithObjects:[UIImage imageNamed:@"下拉加载_动效05"], nil];
    NSArray *refreshingImgs = [NSArray arrayWithObjects:[UIImage imageNamed:@"下拉加载_动效13"],[UIImage imageNamed:@"下拉加载_动效14"],[UIImage imageNamed:@"下拉加载_动效15"],[UIImage imageNamed:@"下拉加载_动效16"],[UIImage imageNamed:@"下拉加载_动效17"],[UIImage imageNamed:@"下拉加载_动效18"],[UIImage imageNamed:@"下拉加载_动效19"], nil];
    
    MJRefreshGifHeaderRewrite *mj_header = [MJRefreshGifHeaderRewrite headerWithRefreshingBlock:^{
        header();
    }];
    
    [mj_header setImages:idleImgs forState:MJRefreshStateIdle];
    [mj_header setImages:pullingImgs forState:MJRefreshStatePulling];
    [mj_header setImages:refreshingImgs forState:MJRefreshStateRefreshing];
    mj_header.lastUpdatedTimeLabel.hidden = YES;
    
    
    // 设置文字
    [mj_header setTitle:@"" forState:MJRefreshStateIdle];
    [mj_header setTitle:@"" forState:MJRefreshStatePulling];
    [mj_header setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
    
    // 设置字体
    mj_header.stateLabel.font = [UIFont systemFontOfSize:15];
    
    // 设置颜色
    mj_header.stateLabel.textColor = [UIColor redColor];
    
    self.tableview.mj_header = mj_header;
}

- (void)startRefreshWithUITableView:(UIScrollView *)scrollView{
    
    
}

- (void)endRefreshing{
    [self.tableview.mj_header endRefreshing];
}

@end
