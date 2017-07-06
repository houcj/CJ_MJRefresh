//
//  MJRefreshGifHeaderRewrite.m
//  CJ_MJRefresh
//
//  Created by 侯春娇 on 2017/7/5.
//  Copyright © 2017年 侯春娇. All rights reserved.
//

#import "MJRefreshGifHeaderRewrite.h"

@implementation MJRefreshGifHeaderRewrite

- (void)placeSubviews{
    [super placeSubviews];
    
    BOOL noConstrainsOnStatusLabel = self.stateLabel.constraints.count == 0;
    
    if (self.lastUpdatedTimeLabel.hidden) {
        // 状态
        if (noConstrainsOnStatusLabel){
            self.stateLabel.mj_x = 0;
            self.stateLabel.mj_y = self.mj_h - self.mj_h * 0.25;
            self.stateLabel.mj_w = self.mj_w;
            self.stateLabel.mj_h = self.mj_h * 0.25;
        };
    }
    
    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
        self.gifView.contentMode = UIViewContentModeCenter;
    } else {
        self.gifView.contentMode = UIViewContentModeScaleAspectFit;
        
        CGFloat stateWidth = self.stateLabel.mj_textWith;
        CGFloat timeWidth = 0.0;
        if (!self.lastUpdatedTimeLabel.hidden) {
            timeWidth = self.lastUpdatedTimeLabel.mj_textWith;
        }
        CGFloat textWidth = MAX(stateWidth, timeWidth);
        self.gifView.mj_w = (self.mj_w * 0.5 - textWidth * 0.5 - self.labelLeftInset) * 0.5;
        self.gifView.mj_x = self.mj_w * 0.5 - self.gifView.mj_w * 0.5;
        self.gifView.mj_h = self.mj_h - self.stateLabel.mj_h;
    }
}

@end
