#import <UIKit/UIKit.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSTableCell.h>
@class NactroCreditOption, NactroCreditService;

@interface NactroCreditCell : PSTableCell
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *positionLabel;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (strong, nonatomic) UIScrollView *optionScrollView;
@property (strong, nonatomic) UIStackView *optionStackView;
@property (strong, nonatomic) NSArray *creditOptions;

- (void)setName:(NSString *)name;
- (void)setPosition:(NSString *)position;
- (void)setAvatarImage:(UIImage *)avatarImage;
- (void)setCreditOptions:(NSArray *)creditOptions;
@end
