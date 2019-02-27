//
//  UIColor+Hex.h
//  slsc
//
//  Created by 陈鹏宇 on 2019/1/31.
//  Copyright © 2019年 ChenPengyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Hex)
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)color;
@end

NS_ASSUME_NONNULL_END
