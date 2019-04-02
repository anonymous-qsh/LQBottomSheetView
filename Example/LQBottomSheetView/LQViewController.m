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

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 50, 100, 20)];
    btn.userInteractionEnabled = NO;
    btn.backgroundColor = [UIColor redColor];
    btn.titleLabel.text = @"Test";

//    [btn bk_whenTapped:^{
//        NSLog(@"TEST");
//    }];

    [self.view addSubview:btn];
}

- (void)maskViewClicked {
    NSLog(@"LQTest: mask clicked.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (double)bounceHeight {
    return 500;
}

- (double)expandedHeight {
    return 300;
}

- (double)collapsedHeight {
    return 100;
}

- (void)animationFinished {

}

@end
