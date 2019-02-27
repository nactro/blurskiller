//
//  UIFont+Extension.m
//  v2ex
//
//  Created by 无头骑士 GJ on 16/7/21.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)

+ (instancetype)PingFangForSize:(CGFloat)size
{
    return [UIFont fontWithName: @"PingFangSC-Medium" size:size];
}
+ (instancetype)PingFangLightForSize:(CGFloat)size{
    return [UIFont fontWithName:@"PingFangSC-Light" size:size];
}
+ (instancetype)PingFangRegularForSize:(CGFloat)size{
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}
+ (instancetype)PingFangSemiboldForSize:(CGFloat)size{
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}
- (void)listAllFonts{
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
}
@end
