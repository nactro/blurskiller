//
//  UIFont+Extension.h
//  v2ex
//
//  Created by 无头骑士 GJ on 16/7/21.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extension)
/*
 简体中文:
 Family: PingFang SC
 Font: PingFangSC-Medium
 Font: PingFangSC-Semibold
 Font: PingFangSC-Light
 Font: PingFangSC-Ultralight
 Font: PingFangSC-Regular
 Font: PingFangSC-Thin
 台湾：
 Family: PingFang TC
 Font: PingFangTC-Regular
 Font: PingFangTC-Thin
 Font: PingFangTC-Medium
 Font: PingFangTC-Semibold
 Font: PingFangTC-Light
 Font: PingFangTC-Ultralight
 香港：
 Family: PingFang HK
 Font: PingFangHK-Medium
 Font: PingFangHK-Thin
 Font: PingFangHK-Regular
 Font: PingFangHK-Ultralight
 Font: PingFangHK-Semibold
 Font: PingFangHK-Light 
 */
+ (instancetype)PingFangForSize:(CGFloat)size;
+ (instancetype)PingFangLightForSize:(CGFloat)size;
+ (instancetype)PingFangRegularForSize:(CGFloat)size;
+ (instancetype)PingFangSemiboldForSize:(CGFloat)size;

- (void)listAllFonts;
@end
