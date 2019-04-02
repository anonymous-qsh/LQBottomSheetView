//
//  LQViewController.m
//  LQBottomSheetView
//
//  Created by Little Queen on 04/01/2019.
//  Copyright (c) 2019 Little Queen. All rights reserved.
//

#import "LQViewController.h"

@interface LQViewController () <LQBottomSheetPresenterDelegate>

@property(nonatomic) LQBottomSheetPresenter *presenter;

@end

@implementation LQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor greenColor];
    _presenter = [[LQBottomSheetPresenter alloc] initWithView:self.view andDelegate:self];
    _presenter.isBottomSheetHidden = YES;
    [_presenter setupBottomSheetViewWithView:view];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 100, 20)];
    btn.backgroundColor = [UIColor redColor];

    [btn bk_whenTapped:^{
        [_presenter dismiss];
    }];

    [self.view addSubview:btn];

    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 20)];
    btn1.backgroundColor = [UIColor greenColor];

    [btn1 bk_whenTapped:^{
        [_presenter display];
    }];

    [self.view addSubview:btn1];
}

- (void)maskViewClicked {
    [_presenter dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (double)bounceHeight {
    return 500;
}

- (double)expandedHeight {
    return 400;
}

- (double)collapsedHeight {
    return 300;
}

- (void)animationFinished {

}

@end
