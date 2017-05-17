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
    [CLTools sharedTools].cornerRadius = self.cornerRadius;
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
    
    if (self.isHighlightTag) {
        _recentTagView.displayTags = self.tagsDisplayArray;
    }
    
    _displayTagView.maxRows = self.maxRows;
    _displayTagView.maxStringAmount = self.maxStringAmount;
    _displayTagView.normalTextColor = self.normalTextColor;
    _displayTagView.textFieldBorderColor = self.textFieldBorderColor;
    
    _recentTagView.tagsModel = self.tagsModelArray;
    _displayTagView.labels = self.tagsDisplayArray;
    
    // nav的属性，根据自己的需求更改
#warning properties of navgitonController, you can reset them for your app
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:cl_colorWithHex(0x66d547) forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [saveBtn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
    self.navigationController.navigationBar.barTintColor = cl_colorWithHex(0x3a393d);
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
   
    self.navigationItem.title = @"标签";
}

// 点击保存，获取输入的标签
- (void)saveItemClick:(UIButton *)sender {
//    NSLog(@"%@", _displayTagView.tags);
    if ([self.tagsDelegate respondsToSelector:@selector(tagViewController:tags:)]) {
        [self.tagsDelegate tagViewController:self tags:_displayTagView.tags];
    }
}



@end
