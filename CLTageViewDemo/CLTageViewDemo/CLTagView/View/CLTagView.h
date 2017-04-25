//
//  CLTagView.h
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/25.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLTagsModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray<NSString *> *tagsArray;

/**
 根据标签文字内容生成的标签按钮
 */
@property (strong, nonatomic, readonly) NSArray *tagBtnArray;


@end

@interface CLTagView : UIView

@property (strong, nonatomic) CLTagsModel *tags;

@end
