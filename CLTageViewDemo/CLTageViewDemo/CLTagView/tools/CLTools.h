//
//  Header.h
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import <UIKit/UIKit.h>
// 通知
UIKIT_EXTERN NSString *const kCLRecentTagViewTagClickNotification;
UIKIT_EXTERN NSString *const kCLRecentTagViewTagClickKey;

UIKIT_EXTERN NSString *const kCLTagViewTagDeleteNotification;
UIKIT_EXTERN NSString *const kCLTagViewTagDeleteKey;

UIKIT_EXTERN NSString *const kCLDisplayTagViewAddTagNotification;
UIKIT_EXTERN NSString *const kCLDisplayTagViewAddTagKey;
UIKIT_EXTERN NSString *const kCLDisplayTagViewAddTagObject;

// 16进制颜色
static inline UIColor *cl_colorWithHex(uint32_t hex) {
    uint8_t red = (hex & 0xff0000) >> 16;
    uint8_t green = (hex & 0x00ff00) >> 8;
    uint8_t blue = hex & 0x0000ff;
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

#define kCLTagFont 13                 // 标签文字的大小
#define kCLDistance 10                // 上下两个标签的间隙
#define kCLTextFieldGap 8             // 标签中，文字距离顶部边界线(4)与底部边界线(4)的距离（ 4 + 4 = 8）
#define kCLTagViewWidth 80            // 标签输入textField默认宽度
#define kCLTextFieldsHorizontalGap 10 // 两个标签框的水平间距
#define kCLTextFieldsVerticalGap 10   // 两个标签框的垂直间距
#define kCLTagViewHorizontaGap 13     // 标签展示页水平两端的与标签的距离
#define kCLDashesBorderWidth 0.8f     // 标签的borderWidth

// 标签展示页
#define kCLTag_Normal_TextColor cl_colorWithHex(0x55b936)      // 标签默认文本颜色
#define kCLTag_Selected_TextColor [UIColor whiteColor]         // 标签选中状态下文本颜色
#define kCLTag_Normal_BorderColor cl_colorWithHex(0x55b936)    // 标签默认border颜色
#define kCLTag_Selected_BorderColor cl_colorWithHex(0x55b936)  // 标签选中状态下border颜色
#define kCLTag_Normal_BackgroundColor [UIColor whiteColor]        // 标签默认背景颜色
#define kCLTag_Selected_BackgroundColor cl_colorWithHex(0x55b936) // 标签选中状态下背景颜色

// 最近标签页
#define kCLHeadViewdHeight 44                   // 最近标签页title的高度
#define kCLRecentTitleFont 13                   // 最近标签页title的font

#define kCLRecentTag_Normal_TextColor cl_colorWithHex(0x474747)    // 标签默认文本颜色
#define kCLRecentTag_Selected_TextColor cl_colorWithHex(0x55b936)  // 标签选中状态下文本颜色
#define kCLRecentTag_Normal_BorderColor cl_colorWithHex(0xdadadd)  // 标签默认border颜色
#define kCLRecentTag_Selected_BorderColor cl_colorWithHex(0x55b936)// 标签选中状态下border颜色
#define kCLRecentTag_Normal_BackgroundColor [UIColor whiteColor]   // 标签默认背景颜色
#define kCLRecentTag_Selected_BackgroundColor [UIColor clearColor] // 标签选中状态下背景颜色


