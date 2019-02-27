#import <Foundation/Foundation.h>
#import "NactroCreditOption.h"

@class NactroCreditOption;

@interface NactroCreditService : NSObject
@property (strong, nonatomic) NSString *usernameFormatter;
@property (strong, nonatomic) NSString *actionTitleFormatter;
@property (strong, nonatomic) NSArray *linkFormatters;
@property (strong, nonatomic) NSString *imageName;

- (instancetype)initWithUsernameFormatter:(NSString *)usernameFormatter actionTitleFormatter:(NSString *)actionTitleFormatter linkFormatters:(NSArray *)linkFormatters imageName:(NSString *)imageName;
- (instancetype)initWithActionTitleFormatter:(NSString *)actionTitleFormatter linkFormatters:(NSArray *)linkFormatters imageName:(NSString *)imageName;

- (NSString *)getFormattedUsernameForOption:(NactroCreditOption *)option;
- (NSString *)getActionTitleForOption:(NactroCreditOption *)option;
- (NSArray *)getLinksForOption:(NactroCreditOption *)option;

// Pre-set:
+ (NactroCreditService *)serviceWithName:(NSString *)name;
@end
