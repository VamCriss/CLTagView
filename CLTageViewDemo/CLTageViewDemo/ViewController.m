//
//  ViewController.m
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "ViewController.h"
#import "CLTagViewController.h"
#import "CLTagsModel.h"

#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] [%s] " fmt), __FUNCTION__, __LINE__, __TIME__,##__VA_ARGS__)
#else
#define NSLog(...)
#endif

@interface ViewController () <CLTagViewControllerDelegate>

@end

@implementation ViewController {
    UILabel *_tagsLabel;
    NSMutableArray *_tagArrayM;
    NSMutableArray *_recentTagsM;
}

- (void)viewWillAppear:(BOOL)animated {
    _tagArrayM = [[NSUserDefaults standardUserDefaults] objectForKey:@"CLTags"];
    if (!_tagArrayM) {
        _tagArrayM = [NSMutableArray array];
    }
    _recentTagsM = [[[NSUserDefaults standardUserDefaults] objectForKey:@"CLRecentTags"] mutableCopy];
    if (!_recentTagsM) {
        _recentTagsM = [NSMutableArray array];
        NSArray *tagsArray = @[@"帅气", @"handsome啊发发发发生", @"酷爱的法师打发", @"1111111111111", @"这是一个设sad挨打大大多", @"撒打算发发发", @"dfsafafafasfaf"];
        [_recentTagsM addObjectsFromArray:tagsArray];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tagsLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    _tagsLabel.font = [UIFont systemFontOfSize:14];
    _tagsLabel.textColor = [UIColor purpleColor];
    _tagsLabel.text = @"";
    _tagsLabel.textAlignment = NSTextAlignmentCenter;
    _tagsLabel.numberOfLines = 0;
    [self.view addSubview:_tagsLabel];
  
}

#pragma mark - 设置标签页的相关属性（初始化）
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CLTagsModel *model = [[CLTagsModel alloc] init];
    model.title = @"所有标签";
    model.tagsArray = _recentTagsM.copy;
    
    CLTagsModel *model1 = [[CLTagsModel alloc] init];
    model1.title = @"第一印象";
    model1.tagsArray = @[@"牛B", @"霸气", @"杜甫", @"李白", @"asdadadasd", @"1231313131", @"sdksalkjfalkjfaj", @"zvkzknmncmalkjdsfkljaskldf"];
    
    CLTagsModel *model2 = [[CLTagsModel alloc] init];
    model2.title = @"我最与众不同的是";
    model2.tagsArray = @[@"确实不同", @"很不同", @"这有什么不同",@"大哥。真的不同", @"sccscasdfaf", @"adf345sdg", @"sadfl;k90808098", @"🌹,💔", @"择力", @"啫喱"];
    
    CLTagViewController *tagVC = [[CLTagViewController alloc] init];
    tagVC.tagsDelegate = self;
//    tagVC.tagsModelArray = @[model];
    tagVC.tagsModelArray = @[model, model1, model2];  // 传入多个模型，显示多个标签组
    tagVC.tagsDisplayArray = _tagArrayM;
    tagVC.highlightTag = YES;
    [self.navigationController pushViewController:tagVC animated:YES];
    _tagsLabel.text = @"";
}
#pragma mark - 属性设置可参照touchesBegan中的设置

#pragma mark - CLTagViewControllerDelegate 返回贴上的标签，并做相关处理
- (void)tagViewController:(CLTagViewController *)tagController tags:(NSArray<NSString *> *)tags {
    
    // 没有网络。。。只能做本地处理。。。
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"CLTags"];
    _tagArrayM = [NSMutableArray array];
    [tagController.navigationController popViewControllerAnimated:YES];
    NSLog(@"%@", tags);
    for (NSString *tag in tags) {
        if (![_recentTagsM containsObject:tag]) {
            [_recentTagsM addObject:tag];
        }
        
        [_tagArrayM addObject:tag];
        
        _tagsLabel.text = [[_tagsLabel.text stringByAppendingString:tag] stringByAppendingString:@" \n "];
    }
    NSLog(@"%@", _tagsLabel.text);
    [[NSUserDefaults standardUserDefaults] setObject:_tagArrayM forKey:@"CLTags"];
    [[NSUserDefaults standardUserDefaults] setObject:_recentTagsM forKey:@"CLRecentTags"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
