//
//  ViewController.m
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "ViewController.h"
#import "CLTagViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
  
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CLTagsModel *model = [[CLTagsModel alloc] init];
    model.title = @"所有标签是啥";
    model.tagsArray = @[@"帅气", @"handsome啊发发发发生", @"酷爱的法师打发", @"1111111111111", @"这是一个设sad挨打大大多", @"撒打算发发发", @"dfsafafafasfaf"];
    CLTagViewController *tagVC = [[CLTagViewController alloc] init];
    tagVC.tagsModelArray = @[model];
    [self.navigationController pushViewController:tagVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
