//
//  ViewController.m
//  CJ_MJRefresh
//
//  Created by 侯春娇 on 2017/7/4.
//  Copyright © 2017年 侯春娇. All rights reserved.
//

#import "ViewController.h"

//#import <MJRefresh.h>
//#import "MJRefreshGifHeaderRewrite.h"
#import "UIViewController+MJRefresh.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    
    [self startRefreshWithUITableView:self.tableview];
    
    [self performSelector:@selector(performEndRefresh) withObject:nil afterDelay:5.0];
}

- (void)performEndRefresh{
    [self endRefreshing];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
