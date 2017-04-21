//
//  CLTagButton.h
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/21.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLTagButton;
@protocol CLTagButtonDelegate <NSObject>

- (void)tagButtonDelete:(CLTagButton *)tagBtn;

@end

@interface CLTagButton : UIButton

- (instancetype)initWithTextField:(UITextField *)textField;

@property (weak, nonatomic) id<CLTagButtonDelegate> deleteDelegate;

@end
