//
//  LQViewController.m
//  LQBottomSheetView
//
//  Created by Little Queen on 04/01/2019.
//  Copyright (c) 2019 Little Queen. All rights reserved.
//

#import "LQViewController.h"
#import "LQDemoTableViewController.h"
#import "LQDemoWithBaseViewController.h"

@interface LQViewController () <LQBottomSheetPresenterDelegate>

@property (nonatomic        ) LQBottomSheetPresenter    *presenter;
@property (nonatomic, strong) LQDemoTableViewController *vc;
@property (nonatomic, strong) LQDemoWithBaseViewController *bvc;
@property (nonatomic, strong) UIButton                  *showBtn;
@property (nonatomic, strong) UIButton                  *dismissBtn;
@property (nonatomic, assign) BOOL                      isFirstDisplay;

@end

@implementation LQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isFirstDisplay = YES;
    
    _vc = [[LQDemoTableViewController alloc] initWithStyle:UITableViewStylePlain];
    _bvc = [[LQDemoWithBaseViewController alloc] init];

    _presenter = [[LQBottomSheetPresenter alloc] initWithView:self.view andDelegate:self];
    _presenter.isBottomSheetHidden = YES;
    _vc.view.userInteractionEnabled = NO;
    _bvc.view.userInteractionEnabled = NO;
//    [_presenter setupBottomSheetViewWithView:_vc.view];

    NSMutableArray *btnArray = [NSMutableArray array];
    
    _showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _showBtn.tag = 1001;
    [_showBtn setTitle:@"Show Bottom Sheet" forState: UIControlStateNormal];
    [_showBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_showBtn bk_whenTapped:^{
        if (self.isFirstDisplay) {
            // when add subview in here, layout relationship will change, so you could bring subview to front.
            [_presenter setupBottomSheetViewWithView:_bvc.view];
            [self.view bringSubviewToFront:_showBtn];
            self.isFirstDisplay = NO;
        } else {
            [_presenter display];
        }
    }];
    [_showBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_showBtn];
    
    _dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _dismissBtn.tag = 1002;
    [_dismissBtn setTitle:@"Dismiss Bottom Sheet" forState: UIControlStateNormal];
    [_dismissBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_dismissBtn bk_whenTapped:^{
        [_presenter dismiss];
    }];
    [_dismissBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_dismissBtn];
    
    [btnArray addObject:_showBtn];
    [btnArray addObject:_dismissBtn];

    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lineView];

    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width/2, 2.5));
    }];
    
    [btnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [btnArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.bottom.equalTo(@-2.5);
    }];

//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 100, 20)];
//    btn.backgroundColor = [UIColor redColor];
//
//    [btn bk_whenTapped:^{
//        [_presenter dismiss];
//    }];
//
//    [self.view addSubview:btn];
//
//    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 20)];
//    btn1.backgroundColor = [UIColor greenColor];
//
//    [btn1 bk_whenTapped:^{
//        [_presenter display];
//    }];
//
//    [self.view addSubview:btn1];
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
    [_vc.tableView reloadData];
}

- (void)bottomSheetWillDisplay {
    _showBtn.userInteractionEnabled    = NO;
    _dismissBtn.userInteractionEnabled = NO;
}

- (void)didBottomSheetDismiss {
    _showBtn.userInteractionEnabled    = YES;
    _dismissBtn.userInteractionEnabled = YES;
}

@end
