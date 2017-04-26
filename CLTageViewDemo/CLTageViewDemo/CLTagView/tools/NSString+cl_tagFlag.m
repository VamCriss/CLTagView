//
//  NSString+cl_tagFlag.m
//  CLTageViewDemo
//
//  Created by Criss on 2017/4/26.
//  Copyright © 2017年 Criss. All rights reserved.
//

#import "NSString+cl_tagFlag.h"
#import <objc/runtime.h>

const char *kCLTagSelected = "kCLTagSelected";
@implementation NSString (cl_tagFlag)

- (void)setCl_selected:(BOOL)cl_selected {
    objc_setAssociatedObject(self, &kCLTagSelected, @(cl_selected), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)cl_selected {
    return [objc_getAssociatedObject(self, &kCLTagSelected) boolValue];
}

@end
