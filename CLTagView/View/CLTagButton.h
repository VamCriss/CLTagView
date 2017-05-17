//
//  CLTagButton.h
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/21.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLTagButton;
@protocol CLTagButtonDelegate <NSObject>

@optional

// 菜单栏删除按钮回调
- (void)tagButtonDelete:(CLTagButton *)tagBtn;

// 展示标签页displayTagView 上的标签点击事件(状态变化已经在内部处理)
- (void)tagButtonDidSelected:(CLTagButton *)tagBtn;

// 最近标签页resentTagView  上的标签点击事件
- (void)recentTagButtonClick:(CLTagButton *)tagBtn;

@end

@interface CLTagButton : UIButton

// 初始化标签展示页的标签(上半部分标签)
- (instancetype)initWithTextField:(UITextField *)textField;

// 初始化最近标签页的标签(下半部分标签)
+ (instancetype)initWithTagDesc:(NSString *)tagStr;

@property (weak, nonatomic) id<CLTagButtonDelegate> tagBtnDelegate;

/**
 最近标签展示页的标签是否被选中
 */
@property (assign, nonatomic) BOOL tagSelected;

/**
 判断标签展示页中前后两次点击的标签是否为自己，用于“删除菜单栏的显示与否”
 */
@property (assign, nonatomic) BOOL isNotSelf;

@end
