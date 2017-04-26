//
//  CLTagsModel.m
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/26.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "CLTagsModel.h"
#import "CLTagButton.h"
#import "CLTools.h"

@implementation CLTagsModel

- (void)setTagsArray:(NSArray<NSString *> *)tagsArray {
    _tagsArray = tagsArray;
    NSMutableArray<CLTagButton *> *tagBtnArrayM = [NSMutableArray array];
    for (int i = 0; i < _tagsArray.count; i ++) {
        CLTagButton *preTagBtn;
        CLTagButton *currentTagBtn;
        preTagBtn = i?tagBtnArrayM[i - 1]: nil;
        currentTagBtn = [CLTagButton initWithTagDesc:_tagsArray[i]];
        [tagBtnArrayM addObject: (CLTagButton *)[self reloadTagViewPreTag:preTagBtn currentTagBtn:currentTagBtn]];
    }
    _tagBtnArray = tagBtnArrayM.copy;
}

- (UIView *)reloadTagViewPreTag:(UIView *)preTagBtn currentTagBtn:(UIView *)currentTagBtn {
    
    CGFloat preTaling = preTagBtn? CGRectGetMaxX(preTagBtn.frame) : 0;
    CGFloat preBottom = preTagBtn? CGRectGetMaxY(preTagBtn.frame) : 0;
    CGFloat preY = preTagBtn? preTagBtn.frame.origin.y : kCLDistance;
    
    if (preTaling + kCLTagViewHorizontaGap * 2 + currentTagBtn.bounds.size.width > [UIScreen mainScreen].bounds.size.width) {
        currentTagBtn.frame = CGRectMake(kCLTagViewHorizontaGap, preBottom + kCLTextFieldsVerticalGap, currentTagBtn.frame.size.width, currentTagBtn.frame.size.height);
    }else {
        currentTagBtn.frame = CGRectMake(preTaling + kCLTextFieldsHorizontalGap, preY, currentTagBtn.frame.size.width, currentTagBtn.frame.size.height);
    }
    return currentTagBtn;
}

@end
