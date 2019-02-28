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
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *devNameLabel;
@end
@implementation NactroHeaderView
- (instancetype)initWithTweakName:(NSString *)tweakName devTeamName:(NSString *)devTeamName backgroundColor:(UIColor *)color{
  self = [super init];
  if (self) {
    [self layoutWithTweakName:tweakName devTeamName:devTeamName backgroundColor:color];
  }
  return self;
}
- (instancetype)initWithFrame:(CGRect)frame tweakName:(NSString *)tweakName devTeamName:(NSString *)devTeamName backgroundColor:(UIColor *)color{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutWithTweakName:tweakName devTeamName:devTeamName backgroundColor:color];
    }
    return self;
}

- (void)layoutWithTweakName:(NSString *)tweakName devTeamName:(NSString *)devTeamName backgroundColor:(UIColor *)color{
    self.backgroundColor = color;

    _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nameLabel.text = tweakName;
    _nameLabel.textColor = [UIColor whiteColor];
    [_nameLabel setFont:[UIFont PingFangRegularForSize:27]];
    [_nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_nameLabel];
    [[_nameLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:17] setActive:YES];
    [[_nameLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor] setActive:YES];
    //[[_nameLabel.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES];
    [[_nameLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:YES];
    //[[_nameLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:17] setActive:YES];
    _devNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _devNameLabel.text = devTeamName;
    _devNameLabel.textColor = [UIColor whiteColor];
    [_devNameLabel setFont:[UIFont PingFangRegularForSize:19]];
    [_devNameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_devNameLabel];
    [[_devNameLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:17] setActive:YES];
    [[_devNameLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor] setActive:YES];
    [[_devNameLabel.bottomAnchor constraintEqualToAnchor:_nameLabel.topAnchor] setActive:YES];

}
@end
