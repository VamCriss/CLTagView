//
//  CLTagButton.m
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/21.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "CLTagButton.h"
#import "CLTools.h"

@implementation CLTagButton {
    UIMenuController *_menuController;
}

- (instancetype)initWithTextField:(UITextField *)textField {
    if (self = [super initWithFrame:textField.frame]) {
        [self initializeAttributeWithTextField:textField];
    }
    return self;
}

- (void)initializeAttributeWithTextField:(UITextField *)textField {
    [self setTitle:textField.text forState:UIControlStateNormal];
    
    [self setTitleColor:cl_colorWithHex(0x55b936) forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
    self.titleLabel.font = textField.font;
    self.layer.cornerRadius = textField.layer.cornerRadius;
    self.layer.borderWidth = 0.8f;
    self.layer.borderColor = cl_colorWithHex(0x55b936).CGColor;
    self.titleLabel.contentMode = UIViewContentModeCenter;
    [self addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (self.isSelected) {
        self.backgroundColor = cl_colorWithHex(0x55b936);
    }else {
         self.backgroundColor = [UIColor whiteColor];
        !_menuController?:[_menuController setMenuVisible:NO animated:YES];
    }
}

- (void)deleteItemClicked:(id)sender {
    self.selected = NO;
    NSLog(@"%@", sender);
    if ([self.tagBtnDelegate respondsToSelector:@selector(tagButtonDelete:)]) {
        [self.tagBtnDelegate tagButtonDelete:self];
    }
}

- (void)tagBtnClick:(UIButton *)sender {
    self.selected = !self.isSelected;
    if (self.selected) {
        _menuController = [UIMenuController sharedMenuController];
        
        UIMenuItem *resetMenuItem = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(deleteItemClicked:)];
        
        NSAssert([self becomeFirstResponder], @"Sorry, UIMenuController will not work with %@ since it cannot become first responder", self);
        [_menuController setMenuItems:[NSArray arrayWithObject:resetMenuItem]];
        [_menuController setTargetRect:self.bounds inView:self];
        [_menuController setMenuVisible:YES animated:YES];
    }
    if ([self.tagBtnDelegate respondsToSelector:@selector(tagButtonDidSelected:)]) {
        [self.tagBtnDelegate tagButtonDidSelected:self];
    }
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

@end
