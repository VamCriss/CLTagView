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
    self.scrollView = scrollView;
    [self addSubview:scrollView];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)setTagsModel:(NSArray<CLTagsModel *> *)tagsModel {
    if (tagsModel.count == 1) {
        CLTagView *tagView = [[CLTagView alloc] init];
        [self.scrollView addSubview:tagView];
        tagView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        tagView.displayTags = self.displayTags;
        tagView.tags = tagsModel.firstObject;
    }
}

@end
