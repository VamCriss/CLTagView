//
//  Header.h
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

// 16进制颜色
static inline UIColor *cl_colorWithHex(uint32_t hex) {
    uint8_t red = (hex & 0xff0000) >> 16;
    uint8_t green = (hex & 0x00ff00) >> 8;
    uint8_t blue = hex & 0x0000ff;
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

#define kCLTagFont 13                 // 标签文字的大小
#define kCLDistance 10                // 上下两个标签的间隙
#define kCLTextFieldGap 8             // 标签中，文字距离顶部(4)与底部(4)的距离（ 4 + 4 = 8）
#define kCLTagViewWidth 80            // 标签输入textField默认宽度
#define kCLTextFieldsHorizontalGap 10 // 两个标签框的水平间距
#define kCLTextFieldsVerticalGap 10   // 两个标签框的垂直间距
#define kCLTagViewHorizontaGap 13     // 标签展示页水平两端的与标签的距离
#define kCLDashesBorderWidth 0.8f     // 标签的borderWidth

#define kCLHeadViewdHeight 44

