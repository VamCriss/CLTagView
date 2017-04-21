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

#define kCLDistance 10
#define kCLTextFieldGap 8
#define kCLTagViewWidth 80
#define kCLTextFieldsHorizontalGap 10
#define kCLTagViewHorizontaGap 13   // 标签展示页tag距离两端的距离

