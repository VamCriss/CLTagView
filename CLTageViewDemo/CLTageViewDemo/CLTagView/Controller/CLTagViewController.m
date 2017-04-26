//
//  CLTagViewController.m
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "CLTagViewController.h"
#import "CLDispalyTagView.h"
#import "CLRecentTagView.h"
#import "CLTools.h"

@interface CLTagViewController ()

@end

@implementation CLTagViewController {
    CLDispalyTagView *_displayTagView;
    CLRecentTagView *_recentTagView;
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
    _displayTagView = [[CLDispalyTagView alloc] initWithOriginalY:originalY Font:kCLTagFont];
    [self.view addSubview:_displayTagView];
    
    _recentTagView = [[CLRecentTagView alloc] init];
    [self.view addSubview:_recentTagView];
    
    _recentTagView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_displayTagView]-0-[_recentTagView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_displayTagView,_recentTagView)]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_recentTagView]-0-|" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:nil views:NSDictionaryOfVariableBindings(_recentTagView)]];
    
    _recentTagView.tagsModel = self.tagsModelArray;
    
    // nav的属性，根据自己的需求更改
    UIBarButtonItem *savaItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveItemClick:)];
    self.navigationItem.rightBarButtonItem = savaItem;
    
    self.navigationItem.title = @"标签";
}

- (void)saveItemClick:(UIBarButtonItem *)sender {
    NSLog(@"%@", _displayTagView.tags);
}


@end
