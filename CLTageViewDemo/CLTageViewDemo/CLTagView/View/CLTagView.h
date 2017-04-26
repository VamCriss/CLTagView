//
//  CLTagView.h
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/25.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLTagsModel;

@interface CLTagView : UIView

@property (strong, nonatomic) CLTagsModel *tags;

/**
 用于高亮最近标签页中相同的标签
 */
@property (strong, nonatomic) NSArray<NSString *> *displayTags;

@end
