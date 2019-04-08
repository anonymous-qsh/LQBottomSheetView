//
//  LQDemoWithBaseViewController.m
//  LQBottomSheetView_Example
//
//  Created by LittleQ on 2019/4/8.
//  Copyright © 2019 Little Queen. All rights reserved.
//

#import "LQDemoWithBaseViewController.h"

#define SCREEN_WIDTH [UIScreen  mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define SAFE_AREA_TOP_HEIGHT (SCREEN_HEIGHT == 812.0 ? 88 : 64)

@interface LQDemoWithBaseViewController()

@end

@implementation LQDemoWithBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.lqTableView.backgroundColor = [UIColor whiteColor];
    [self.lqTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.mas_equalTo(0);
//        make.top.equalTo(self.view).offset(SAFE_AREA_TOP_HEIGHT);
    }];
    
    [self addSection];
}

- (void) addSection {
    RETableViewSection *section = [RETableViewSection section];
    
    // custom label with insets.
    LQInsetsLabel *headerView = [[LQInsetsLabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.f, 24.0f)];
    headerView.textInsets = UIEdgeInsetsMake(0.f, 15.f, 0.f, 0.f);
    
    headerView.backgroundColor = [UIColor grayColor];
    headerView.text = @"Table Header";
    headerView.font = [UIFont systemFontOfSize:10];
    
    section.headerView = headerView;
    section.headerHeight = 30;
    
    for (int i = 0; i < 5; ++i) {
        [section addItem:[[LQReadOnlyItem alloc] initWithTitle:[NSString stringWithFormat:@"Title--%d", i] value:[NSString stringWithFormat:@"Value--%d", i]]];
    }
    
    [self.lqManager addSection:section];
    [self.lqTableView reloadData];
}

@end
