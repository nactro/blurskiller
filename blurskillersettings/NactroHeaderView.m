//
//  NactroHeaderView.m
//  slsc
//
//  Created by 陈鹏宇 on 2019/2/27.
//  Copyright © 2019年 ChenPengyu. All rights reserved.
//

#import "NactroHeaderView.h"
#import "UIFont+Extension.h"
#import "UIColor+Hex.h"

@interface NactroHeaderView()
@end
@implementation NactroHeaderView

- (instancetype)initWithFrame:(CGRect)frame tweakName:(NSString *)tweakName devTeamName:(NSString *)devTeamName backgroundColor:(UIColor *)color{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutWithTweakName:tweakName devTeamName:devTeamName backgroundColor:color];
    }
    return self;
}

- (void)layoutWithTweakName:(NSString *)tweakName devTeamName:(NSString *)devTeamName backgroundColor:(UIColor *)color{
    self.backgroundColor = color;
    CGFloat width = self.frame.size.width - 40;
    // Title Label
    UIFont *titleFont = [UIFont PingFangRegularForSize:27];
    NSString *title = tweakName;
    CGSize labelSize = [title boundingRectWithSize:CGSizeMake(width, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleFont} context:nil].size;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, width, labelSize.height)];
    label.text = title;
    label.font = titleFont;
    label.numberOfLines = 1;
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 10.0f/12.0f;
    label.clipsToBounds = YES;
    label.textColor = [UIColor whiteColor];
    [self addSubview:label];
    
    // Subtitle label
    UIFont *subtitleFont = [UIFont PingFangRegularForSize:19];
    NSString *subtitle = devTeamName;
    CGSize subtitleLabelSize = [subtitle boundingRectWithSize:CGSizeMake(width, 60) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:subtitleFont} context:nil].size;
    UILabel *sublabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, width, subtitleLabelSize.height)];
    sublabel.text = subtitle;
    sublabel.font = subtitleFont;
    sublabel.numberOfLines = 1;
    sublabel.adjustsFontSizeToFitWidth = YES;
    sublabel.minimumScaleFactor = 10.0f/12.0f;
    sublabel.clipsToBounds = YES;
    sublabel.textColor = [UIColor whiteColor];
    [self addSubview:sublabel];
}
@end
