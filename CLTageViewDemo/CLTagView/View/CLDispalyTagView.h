//
//  CLDispalyTagView.h
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLDispalyTagView : UIScrollView

- (instancetype)initWithOriginalY:(CGFloat)originalY Font:(CGFloat)fontSize;

/**
 设置输入框中输入时标签的文字颜色(默认黑色)
 */
@property (strong, nonatomic) UIColor *normalTextColor;

/**
 设置输入框中输入时标签的边框颜色(默认灰色)
 */
@property (strong, nonatomic) UIColor *textFieldBorderColor;

/**
 限制单个标签最大输入的字符个数（默认是10）
 */
@property (assign, nonatomic) NSInteger maxStringAmount;

/**
 最多显示标签的行数(默认是3)
 */
@property (assign, nonatomic) NSInteger maxRows;

/**
 显示已经被打上的标签,如果不想显示传递nil
 */
@property (strong, nonatomic) NSArray<NSString *> *labels;

/**
 获取贴上的标签
 */
@property (strong, nonatomic, readonly) NSArray *tags;


@end
