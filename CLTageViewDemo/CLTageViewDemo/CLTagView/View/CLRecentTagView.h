//
//  CLRecentTagView.h
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLTagsModel;

@interface CLRecentTagView : UIView

/**
 用于高亮最近标签页中相同的标签(要高亮的话，需先给displayTags赋值，再赋值tagsModel)
 */
@property (strong, nonatomic) NSArray<NSString *> *displayTags;

/**
 最近标签页中显示的标签
 */
@property (strong, nonatomic) NSArray<CLTagsModel *> *tagsModel;

@end
