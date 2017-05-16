//
//  CLTools.m
//  CLTageViewDemo
//
//  Created by 邢媛媛 on 2017/4/25.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "CLTools.h"

NSString *const kCLRecentTagViewTagClickNotification = @"kCLRecentTagViewTagClickNotification";
NSString *const kCLRecentTagViewTagClickKey = @"kCLRecentTagViewTagClickKey";

NSString *const kCLTagViewTagDeleteNotification = @"kCLTagViewTagDeleteNotification";
NSString *const kCLTagViewTagDeleteKey = @"kCLTagViewTagDeleteKey";

NSString *const kCLDisplayTagViewAddTagNotification = @"kCLDisplayTagViewAddTagNotification";
NSString *const kCLDisplayTagViewAddTagKey = @"kCLDisplayTagViewAddTagKey";
NSString *const kCLDisplayTagViewAddTagObject = @"kCLDisplayTagViewAddTagObject";

@implementation CLTools

+ (instancetype)sharedTools {
    static CLTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

@end
