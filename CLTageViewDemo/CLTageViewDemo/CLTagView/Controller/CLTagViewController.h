//
//  CLTagViewController.h
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLTagsModel;
@class CLTagViewController;
@protocol CLTagViewControllerDelegate <NSObject>

/**
 返回标签展示页的所有标签
 @param tags 标签
 */
- (void)tagViewController:(CLTagViewController *)tagController tags:(NSArray<NSString *> *)tags;

@end

@interface CLTagViewController : UIViewController

@property (weak, nonatomic) id<CLTagViewControllerDelegate> tagsDelegate;

/**
 标签展示页默认显示标签
 */
@property (nonatomic, strong) NSArray<NSString *> *tagsDisplayArray;

/**
 最近标签页默认显示的标签
 */
@property (nonatomic, strong) NSArray<CLTagsModel *> *tagsModelArray;

/**
 最近标签页是否高亮展示页中相同的标签
 */
@property (assign, nonatomic, getter=isHighlightTag) BOOL highlightTag;

@end
