//
//  NactroHeaderView.h
//  slsc
//
//  Created by 陈鹏宇 on 2019/2/27.
//  Copyright © 2019年 ChenPengyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFont+Extension.h"
@interface NactroHeaderView : UIView
- (instancetype)initWithFrame:(CGRect)frame tweakName:(NSString *)tweakName devTeamName:(NSString *)devTeamName backgroundColor:(UIColor *)color;
@end
