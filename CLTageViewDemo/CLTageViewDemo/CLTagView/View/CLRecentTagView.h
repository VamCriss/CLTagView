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

@property (strong, nonatomic) NSArray<CLTagsModel *> *tagsModel;

@end
