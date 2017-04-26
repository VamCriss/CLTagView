//
//  CLTagsModel.h
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/26.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLTagButton;

@interface CLTagsModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray<NSString *> *tagsArray;

/**
 根据标签文字内容生成的标签按钮
 */
@property (strong, nonatomic, readonly) NSArray<CLTagButton *> *tagBtnArray;


@end

