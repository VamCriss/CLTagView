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

- (void)tagButtonDelete:(CLTagButton *)tagBtn;

// displayTagView 上的点击事件(状态变化已经在内部处理)
- (void)tagButtonDidSelected:(CLTagButton *)tagBtn;

@end

@interface CLTagButton : UIButton

- (instancetype)initWithTextField:(UITextField *)textField;

+ (instancetype)initWithTagDesc:(NSString *)tagStr;

@property (weak, nonatomic) id<CLTagButtonDelegate> tagBtnDelegate;

@end
