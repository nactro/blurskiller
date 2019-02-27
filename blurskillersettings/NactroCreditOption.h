#import <Foundation/Foundation.h>
#import "NactroCreditService.h"
@class NactroCreditService;
@interface NactroCreditOption : NSObject
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NactroCreditService *service;
@property (strong, nonatomic) NSString *forcedFormattedUsername;

- (instancetype)initWithUsername:(NSString *)username service:(NactroCreditService *)service;
- (instancetype)initWithUsername:(NSString *)username service:(NactroCreditService *)service forcedFormattedUsername:(NSString *)forcedFormattedUsername;

- (NSString *)getActionTitle;
- (NSArray *)getLinks;
- (void)open;
@end
