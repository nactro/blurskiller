#include "BlursKillerRootListController.h"
#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSSwitchTableCell.h>
#import "NactroCreditService.h"
#import "NactroCreditOption.h"
#import "NactroCreditCell.h"
#import "UIColor+Hex.h"
#import "UIFont+Extension.h"
#include <spawn.h>
#import <UIKit/UIKit.h>
#import "NactroHeaderView.h"

#define HEADER_HEIGHT 160.0f
@interface BlursKillerRootListController()
@property (nonatomic, strong)NactroHeaderView *headerView;
@end
@implementation BlursKillerRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
- (CGFloat)tableView:(id)tableView heightForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return HEADER_HEIGHT;
	}else{
		return [super tableView:tableView heightForHeaderInSection:section];
	}
}

- (void)viewDidLoad{
	[super viewDidLoad];

}
/* Tint navbar items. */
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	//use icon instead of title text
	UIImage *icon = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/BlursKillerSettings.bundle/icon.png"];
	//init
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:icon];
	//self.navigationController.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:@"#3283ec"];
	// tint navbar
	self.navigationController.navigationController.navigationBar.tintColor = [UIColor colorWithHexString:@"#3283ec"];
}
- (void)viewWillDisappear:(BOOL)animated {
	// un-tint navbar
	self.navigationController.navigationController.navigationBar.tintColor = nil;

	[super viewWillDisappear:animated];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	//获取偏移量
	    CGPoint offset = scrollView.contentOffset;
	    //判断是否改变
	    if (offset.y < 0) {
	        CGRect rect = self.headerView.frame;
	  //我们只需要改变图片的y值和高度即可
	        rect.origin.y = offset.y;
	        rect.size.height = 200 - offset.y;
	        self.headerView.frame = rect;
	    }
}
- (id)tableView:(id)tableView viewForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		    _headerView = [[NactroHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150.0f) tweakName:@"HelloWorld" devTeamName:@"HelloDev" backgroundColor:[UIColor colorWithHexString:@"#3283ec"]];
		// // add table header
    //     CGFloat width = self.view.frame.size.width - 40;
    //     UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, HEADER_HEIGHT)];
		// 		headerView.backgroundColor = [UIColor colorWithHexString:@"#3283ec"];
		// 		//headerView.backgroundColor = [UIColor clearColor];
    //     // Title Label
		// 		UIFont *titleFont = [UIFont PingFangRegularForSize:27];
    //     NSString *title = @"BlurKillers XII";
    //     CGSize labelSize = [title boundingRectWithSize:CGSizeMake(width, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleFont} context:nil].size;
    //     UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, width, labelSize.height)];
    //     label.text = title;
    //     label.font = titleFont;
    //     label.numberOfLines = 1;
    //     label.adjustsFontSizeToFitWidth = YES;
    //     label.minimumScaleFactor = 10.0f/12.0f;
    //     label.clipsToBounds = YES;
    //     label.textColor = [UIColor blackColor];
    //     [headerView addSubview:label];
		//
    //     // Subtitle label
    //     UIFont *subtitleFont = [UIFont PingFangRegularForSize:19];
    //     NSString *subtitle = @"Nactro Team.";
    //     CGSize subtitleLabelSize = [subtitle boundingRectWithSize:CGSizeMake(width, 60) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:subtitleFont} context:nil].size;
    //     UILabel *sublabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, width, subtitleLabelSize.height)];
    //     sublabel.text = subtitle;
    //     sublabel.font = subtitleFont;
    //     sublabel.numberOfLines = 1;
    //     sublabel.adjustsFontSizeToFitWidth = YES;
    //     sublabel.minimumScaleFactor = 10.0f/12.0f;
    //     sublabel.clipsToBounds = YES;
    //     sublabel.textColor = [UIColor blackColor];
    //     [headerView addSubview:sublabel];
	  return _headerView;
	}else{
		return [super tableView:tableView viewForHeaderInSection:section];
	}
}

- (void)openDonate {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://apt.nactro.com/"]];
}

- (void)killSpringBoard{
	  //if (command.size() >= 0)
		pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}

-  (void)getNewWallpaper{
		NSString *wallpaperPath = @"/var/mobile/wallpaper.png";
		NSFileManager *fileManager = [NSFileManager defaultManager];
		BOOL res= [fileManager removeItemAtPath:wallpaperPath error:nil];
		if (res) {
			UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"操作成功：即将注销设备。" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
			[alert show];
			//显示框
			UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
			indicator.backgroundColor=[UIColor redColor];
			indicator.center = CGPointMake(alert.bounds.size.width/2,  alert.bounds.size.height-40.0);
			[indicator startAnimating];

			[alert insertSubview:indicator atIndex:0];
			//定时器
			[NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(killSpringBoard) userInfo:[NSDictionary dictionaryWithObjectsAndKeys:alert, @"alert", @"testing ", @"key" ,nil]  repeats:NO];
		}else{
			UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"操作失败：未找到原有蒙版。" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
			[alert show];
			//显示框
			UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
			indicator.backgroundColor=[UIColor redColor];
			indicator.center = CGPointMake(alert.bounds.size.width/2,  alert.bounds.size.height-40.0);
			[indicator startAnimating];

			[alert insertSubview:indicator atIndex:0];
			//定时器
			[NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(dismissAlert:) userInfo:[NSDictionary dictionaryWithObjectsAndKeys:alert, @"alert", @"testing ", @"key" ,nil]  repeats:NO];
		}
}

//alert 自动消失
-(void) dismissAlert:(NSTimer *)timer{
    UIAlertView *alert = [[timer userInfo]objectForKey:@"alert"];
    [alert dismissWithClickedButtonIndex:0 animated:YES];
}

#pragma mark - setter & getter
- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
}

@end
