//
//  CLTagViewController.m
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "CLTagViewController.h"
#import "CLDispalyTagView.h"

@interface CLTagViewController ()

@end

@implementation CLTagViewController {
    CLDispalyTagView *_displayTagView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self showUI];
}

- (void)showUI {
    CGFloat originalY = 0;
    if (self.navigationController) {
        originalY = 64;
    }
    self.automaticallyAdjustsScrollViewInsets = NO;
    _displayTagView = [[CLDispalyTagView alloc] initWithOriginalY:originalY Font:13];
    [self.view addSubview:_displayTagView];
}


@end
