//
// LQDemoTableViewController.m
//
// Created by LittleQ on 2019-04-03.
// Copyright (c) 2019 Little.Q All rights reserved.
//

#import "LQDemoTableViewController.h"

@interface LQDemoTableViewController()

@property (strong, readwrite, nonatomic) RETableViewManager *manager;

@end

@implementation LQDemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    self.manager.delegate = self;

    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];

    for (int i = 0; i < 20; i++) {
        [section addItem:[RETableViewItem itemWithTitle:@"TEST"]];
    }
}

@end
