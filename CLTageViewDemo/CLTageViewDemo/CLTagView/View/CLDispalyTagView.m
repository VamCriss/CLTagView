//
//  CLDispalyTagView.m
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/20.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "CLDispalyTagView.h"
#import "CLTools.h"
#import "CLTagButton.h"

@class CLTagTextField;
@protocol CLTagTextFieldDelegate <NSObject>

- (void)tagTextField:(CLTagTextField *)tagTextField;

@end
@interface CLTagTextField : UITextField

@property (weak, nonatomic) id<CLTagTextFieldDelegate> tfDelegate;

@end

@implementation CLTagTextField

- (void)deleteBackward {
    [super deleteBackward];
    if ([self.tfDelegate respondsToSelector:@selector(tagTextField:)]) {
        [self.tfDelegate tagTextField:self];
    }
}

// placeholder position
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x+(self.layer.cornerRadius?:3), bounds.origin.y, bounds.size.width-(self.layer.cornerRadius?:3), bounds.size.height);
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x+(self.layer.cornerRadius?:3), bounds.origin.y, bounds.size.width-(self.layer.cornerRadius?:3), bounds.size.height);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIScrollView *view in self.subviews)
    {
        if ([view isKindOfClass:[UIScrollView class]])
        {
            CGPoint offset = view.contentOffset;
            if (offset.y != 0)
            {
                offset.y = 0;
                view.contentOffset = offset;
            }
            break;
        }
    }
}

@end

@interface CLDispalyTagView () <UITextFieldDelegate, CLTagTextFieldDelegate, CLTagButtonDelegate>

@property (strong, nonatomic) CAShapeLayer *border;
@property (strong, nonatomic) NSMutableArray<CLTagButton *> *tagBtnArrayM;
@property (strong, nonatomic) NSCache *tagCache;


@end

@implementation CLDispalyTagView {
    CLTagTextField *_inputField;
    CGFloat _originalWidth;
    UIMenuController *_menuController;
}

- (instancetype)initWithOriginalY:(CGFloat)originalY Font:(CGFloat)fontSize; {
    _inputField = [[CLTagTextField alloc] init];
    _inputField.placeholder = @"输入标签";
    _inputField.borderStyle = UITextBorderStyleNone;
    _inputField.layer.borderColor = cl_colorWithHex(0x55b936).CGColor;
    _inputField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _inputField.autocorrectionType = UITextAutocorrectionTypeNo;
    [_inputField sizeToFit];
    fontSize? (_inputField.font = [UIFont systemFontOfSize:fontSize]): nil;
    return [self initWithFrame:CGRectMake(0, originalY, [UIScreen mainScreen].bounds.size.width, _inputField.bounds.size.height + kCLDistance * 2 + kCLTextFieldGap)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    [self addSubview:_inputField];
    _inputField.delegate = self;
    _inputField.tfDelegate = self;
    CGFloat height = _inputField.bounds.size.height + kCLTextFieldGap;
    _originalWidth = [_inputField.placeholder sizeWithAttributes:@{NSFontAttributeName:_inputField.font}].width + height;
    _inputField.frame = CGRectMake(kCLTagViewHorizontaGap, kCLDistance, _originalWidth, _inputField.bounds.size.height + kCLTextFieldGap);
    _inputField.layer.cornerRadius = _inputField.bounds.size.height * 0.5;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@" "] && textField.text.length == 0) {
        return NO;
    }
    [self textFieldDashesWithTextField:textField];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self addTagWithTag:textField.text];

    textField.text = @"";
    self.border.lineWidth = 0;
    return YES;
}

- (void)addTagWithTag:(NSString *)text {
    if (![self.tagCache objectForKey:text]) {
        CLTagButton *tagBtn = [[CLTagButton alloc] initWithTextField:_inputField];
        tagBtn.deleteDelegate = self;
        [self addSubview:tagBtn];
        [self.tagBtnArrayM addObject:tagBtn];
        [self.tagCache setObject:tagBtn forKey:text];
        [self reloadTagViewPreTag:tagBtn currentTagBtn:_inputField];
        [self textFieldDashesWithTextField:_inputField];
    }
}

- (void)removeTagWithTag:(NSString *)tag {
    CLTagButton *tagbtn = [self.tagCache objectForKey:tag];
    NSInteger index = [self.tagBtnArrayM indexOfObject:tagbtn];
    [self.tagCache removeObjectForKey:tag];
    [self.tagBtnArrayM[index] removeFromSuperview];
    [self.tagBtnArrayM removeObjectAtIndex:index];
    
    if (index == self.tagBtnArrayM.count) {
        [self reloadTagViewPreTag:self.tagBtnArrayM.lastObject currentTagBtn:_inputField];
        return;
    }
    for (NSInteger i = index; i < self.tagBtnArrayM.count; i ++) {
        [self reloadTagViewPreTag:i?self.tagBtnArrayM[i - 1]:nil currentTagBtn:self.tagBtnArrayM[i]];
    }
    [self reloadTagViewPreTag:self.tagBtnArrayM.lastObject currentTagBtn:_inputField];
    
}

- (void)reloadTagViewPreTag:(UIView *)preTagBtn currentTagBtn:(UIView *)currentTagBtn {
    if ([currentTagBtn isKindOfClass:[CLTagTextField class]]) {
        CGRect rect = currentTagBtn.frame;
        rect.size.width = _originalWidth;
        currentTagBtn.frame = rect;
    }
    
    CGFloat preTaling = preTagBtn? CGRectGetMaxX(preTagBtn.frame) : 0;
    CGFloat preBottom = preTagBtn? CGRectGetMaxY(preTagBtn.frame) : 0;
    CGFloat preY = preTagBtn? preTagBtn.frame.origin.y : kCLDistance;
    
    if (preTaling + kCLTagViewHorizontaGap * 2 + currentTagBtn.bounds.size.width > [UIScreen mainScreen].bounds.size.width) {
        currentTagBtn.frame = CGRectMake(kCLTagViewHorizontaGap, preBottom + kCLDistance, currentTagBtn.frame.size.width, currentTagBtn.frame.size.height);
    }else {
        currentTagBtn.frame = CGRectMake(preTaling + kCLTextFieldsHorizontalGap, preY, currentTagBtn.frame.size.width, currentTagBtn.frame.size.height);
    }
    
    CGFloat tagViewHeight = self.frame.size.height;
    CGFloat tagViewExpectHeight = CGRectGetMaxY(currentTagBtn.frame) + kCLDistance;
    if (tagViewHeight != tagViewExpectHeight) {
        CGRect tagViewRect = self.frame;
        tagViewRect.size.height = tagViewExpectHeight;
        self.frame = tagViewRect;
    }
}

#pragma mark - CLTagButtonDelegate
- (void)tagButtonDelete:(CLTagButton *)tagBtn {
    [self removeTagWithTag:tagBtn.titleLabel.text];
}

#pragma mark - CLTagTextFieldDelegate
- (void)tagTextField:(CLTagTextField *)tagTextField {
    if (tagTextField.text.length ==0) {
        self.border.lineWidth = 0;
    }
}

#pragma mark - 虚线边框
- (void)textFieldDashesWithTextField:(UITextField *)textField {
    textField.borderStyle =  UITextBorderStyleNone;
    if (self.border) {
        if (self.border.lineWidth == 0) {
            self.border.lineWidth = 0.8f;
        }
        self.border.path = [UIBezierPath bezierPathWithRoundedRect:textField.bounds cornerRadius:textField.layer.cornerRadius].CGPath;
        return;
    }
    CAShapeLayer *border = [CAShapeLayer layer];
    
    border.strokeColor = self.textFieldBorderColor.CGColor?:cl_colorWithHex(0xdadadd).CGColor;
    
    border.fillColor = nil;
    
    border.path = [UIBezierPath bezierPathWithRoundedRect:textField.bounds cornerRadius:textField.layer.cornerRadius].CGPath;
    
    border.frame = textField.bounds;
    
    border.lineWidth = 0.8f;
    
    border.lineCap = @"round";
    
    border.lineDashPattern = @[@4, @2];
    self.border = border;
    
    [textField.layer addSublayer:border];
}

#pragma mark - lazy
- (NSMutableArray<CLTagButton *> *)tagBtnArrayM {
    if (!_tagBtnArrayM) {
        _tagBtnArrayM = [NSMutableArray array];
    }
    return _tagBtnArrayM;
}

- (NSCache *)tagCache {
    if (!_tagCache) {
        _tagCache = [[NSCache alloc] init];
    }
    return _tagCache;
}
@end
