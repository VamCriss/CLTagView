//
//  CLTagView.m
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/25.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "CLTagView.h"
#import "CLTools.h"
#import "CLTagButton.h"
#import "CLTagsModel.h"

@interface CLTagView () <CLTagButtonDelegate>

@property (nonatomic, weak) UILabel *titleLabel;
@property (weak, nonatomic) UIView *tagsShowView;
@property (nonatomic, strong) NSMutableDictionary *tagsCache;

@end

@implementation CLTagView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    _tagsCache = [NSMutableDictionary dictionary];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTagsStatus:) name:kCLTagViewTagDeleteNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTagsStatus:) name:kCLDisplayTagViewAddTagNotification object:kCLDisplayTagViewAddTagObject];
    
    self.backgroundColor = [UIColor purpleColor];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kCLHeadViewdHeight)];
    [self addSubview:headView];
    headView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    headView.backgroundColor = cl_colorWithHex(0xf0eff3);
    
    UILabel *titleLabel = [[UILabel alloc] init];
    self.titleLabel = titleLabel;
    titleLabel.text = @"所有标签";
    titleLabel.font = [UIFont systemFontOfSize:kCLRecentTitleFont];
    titleLabel.textColor = cl_colorWithHex(0x8a949b);
    [headView addSubview:titleLabel];
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [headView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[titleLabel]-0-|" options:0 metrics:@{@"left": @(kCLTagViewHorizontaGap)} views:NSDictionaryOfVariableBindings(titleLabel)]];
    [headView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[titleLabel(==height)]" options:0 metrics:@{@"height": @(kCLHeadViewdHeight)} views:NSDictionaryOfVariableBindings(titleLabel)]];
    
    UIView *tagsShowView = [[UIView alloc] init];
    tagsShowView.backgroundColor = headView.backgroundColor;
    self.tagsShowView = tagsShowView;
    [self addSubview:tagsShowView];
    tagsShowView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tagsShowView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tagsShowView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[headView]-0-[tagsShowView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(headView, tagsShowView)]];
    
}

- (void)setTags:(CLTagsModel *)tags{
    _tags = tags;
    self.titleLabel.text = tags.title;
    [self layoutTags:tags.tagBtnArray];
}

- (void)layoutTags:(NSArray<CLTagButton *> *)tags {
    for (CLTagButton *tagBtn in tags) {
        tagBtn.tagBtnDelegate = self;
        [_tagsCache setObject:tagBtn forKey:tagBtn.titleLabel.text];
        [self.tagsShowView addSubview:tagBtn];
    }
    
    if (self.displayTags.count > 0) {
        for (NSString *tagDes in self.displayTags) {
            CLTagButton *btn =[_tagsCache objectForKey:tagDes];
            if (btn) {
                btn.tagSelected = YES;
            }
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.reloadScrollViewContenSize) {
            self.reloadScrollViewContenSize(CGRectGetMaxY(tags.lastObject.frame) + kCLDistance + kCLHeadViewdHeight);
        }
    });
}

- (void)recentTagButtonClick:(CLTagButton *)tagBtn {
    [[NSNotificationCenter defaultCenter] postNotificationName:kCLRecentTagViewTagClickNotification object:nil userInfo:@{kCLRecentTagViewTagClickKey: tagBtn}];
}

#pragma mark - 通知
- (void)reloadTagsStatus:(NSNotification *)notification {
    
    if (notification.object == nil) {
        CLTagButton *tagBtn = notification.userInfo[kCLTagViewTagDeleteKey];
        CLTagButton *deleteTagBtn = [_tagsCache objectForKey:tagBtn.titleLabel.text];
        deleteTagBtn.tagSelected = NO;
        return;
    }
    
    if ([notification.object isKindOfClass:[NSString class]]) {
        NSString *obj = notification.object;
        if ([obj isEqualToString:kCLDisplayTagViewAddTagObject]) {
            NSString *key = notification.userInfo[kCLDisplayTagViewAddTagKey];
            CLTagButton *deleteTagBtn = [_tagsCache objectForKey:key];
            deleteTagBtn.tagSelected = YES;
        }
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end



