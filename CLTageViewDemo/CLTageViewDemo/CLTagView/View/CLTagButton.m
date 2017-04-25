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
    
    [self attributeRadius:textField.layer.cornerRadius borderWidth:kCLDashesBorderWidth borderColor:cl_colorWithHex(0x55b936) contentMode:UIViewContentModeCenter font:textField.font];
    [self addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

+ (instancetype)initWithTagDesc:(NSString *)tagStr {
    CLTagButton *tagBtn = [[CLTagButton alloc] init];
    [tagBtn setTitle:tagStr forState:UIControlStateNormal];
    [tagBtn setTitleColor:cl_colorWithHex(0x474747) forState:UIControlStateNormal];
    tagBtn.titleLabel.font = [UIFont systemFontOfSize:kCLTagFont];
    [tagBtn sizeToFit];
    CGFloat height = tagBtn.bounds.size.height + kCLTextFieldGap;
    [tagBtn attributeRadius:height * 0.5 borderWidth:kCLDashesBorderWidth borderColor:cl_colorWithHex(0xdadadd) contentMode:UIViewContentModeCenter font:tagBtn.titleLabel.font];
    CGFloat width = [tagStr sizeWithAttributes:@{NSFontAttributeName:tagBtn.titleLabel.font}].width + height;
    tagBtn.frame = CGRectMake(kCLTagViewHorizontaGap, kCLDistance, width, height);
    return tagBtn;
}

- (void)attributeRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor contentMode:(UIViewContentMode)contentMode font:(UIFont *)font{
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    self.titleLabel.contentMode = contentMode;
    self.titleLabel.font = font;
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
