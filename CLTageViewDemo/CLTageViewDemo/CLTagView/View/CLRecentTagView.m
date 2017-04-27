//
//  CLRecentTagView.m
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "CLRecentTagView.h"
#import "CLTagView.h"
#import "CLTools.h"
#import "CLTagsModel.h"
#import "CLTagButton.h"

@interface CLRecentTagView ()

@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation CLRecentTagView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self showUI];
    }
    return self;
}

- (void)showUI {
    self.backgroundColor = cl_colorWithHex(0xf0eff3);
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.alwaysBounceVertical = YES;
    scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.scrollView = scrollView;
    [self addSubview:scrollView];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)setTagsModel:(NSArray<CLTagsModel *> *)tagsModel {
    CLTagView *lastTagView;
    CLTagView *perTagView;
    for (int i = 0; i < tagsModel.count; i ++) {
        CLTagView *tagView = [[CLTagView alloc] init];
        [self.scrollView addSubview:tagView];
        
        tagView.frame = CGRectMake(0, !i?:(CGRectGetMaxY(perTagView.frame) + kCLDistance), [UIScreen mainScreen].bounds.size.width, CGRectGetMaxY(tagsModel[i].tagBtnArray.lastObject.frame)+ kCLDistance + kCLHeadViewdHeight);
    
        tagView.displayTags = self.displayTags;
        tagView.tags = tagsModel[i];
    
        perTagView = tagView;
        if (i == tagsModel.count - 1) {
            lastTagView = tagView;
        }
    }
    
    CGSize scrollContenSize = self.scrollView.contentSize;
    scrollContenSize.height = CGRectGetMaxY(lastTagView.frame);
    self.scrollView.contentSize = scrollContenSize;
    
}

@end
