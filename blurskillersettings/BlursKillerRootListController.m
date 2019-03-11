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

static BOOL KBDarkText = NO;
static BOOL KBSettings = NO;
static NSString *kPrefsPath = @"/var/mobile/Library/Preferences/com.nactro.blurskillersettings.plist";
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define HEADER_HEIGHT 120.0f
static NSString *tweakName = @"透明板 v1.1.3";

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
	// tint navbar
	self.navigationController.navigationController.navigationBar.tintColor = [UIColor colorWithHexString:@"#3283ec"];
	// 读取是否开启设置透明，如果开启了，则把背景的颜色改成 clearColor
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:kPrefsPath];
  if (prefs) {
    KBSettings = ([[prefs objectForKey:@"KBSettings"] boolValue]?:KBSettings);
		KBDarkText = ([[prefs objectForKey:@"KBDarkText"] boolValue] ?: KBDarkText);
  }
	if (KBSettings) {
		if (KBDarkText) {
			self.headerView.backgroundColor = [UIColor clearColor];
			self.headerView.nameLabel.textColor = [UIColor blackColor];
			self.headerView.devNameLabel.textColor = [UIColor blackColor];
		}else{
			self.headerView.backgroundColor = [UIColor clearColor];
			self.headerView.nameLabel.textColor = [UIColor whiteColor];
			self.headerView.devNameLabel.textColor = [UIColor whiteColor];
		}
	}
}
- (void)viewWillDisappear:(BOOL)animated {
	// un-tint navbar
	self.navigationController.navigationController.navigationBar.tintColor = nil;

	[super viewWillDisappear:animated];
}

- (id)tableView:(id)tableView viewForHeaderInSection:(NSInteger)section {
	if (section == 0){
	  return self.headerView;
	}else{
		return [super tableView:tableView viewForHeaderInSection:section];
	}
}

- (void)openDonate {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"alipayqr://platformapi/startapp?saId=10000007&qrcode=https://qr.alipay.com/tsx09384ad5mkh65g1irre0"]];
}

- (void)killSpringBoard{
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
			//定时器
			[NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(killSpringBoard) userInfo:[NSDictionary dictionaryWithObjectsAndKeys:alert, @"alert", @"success ", @"key" ,nil]  repeats:NO];
		}else{
			UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"操作失败：未找到原有蒙版。" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
			[alert show];
			[NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(dismissAlert:) userInfo:[NSDictionary dictionaryWithObjectsAndKeys:alert, @"alert", @"dismiss ", @"key" ,nil]  repeats:NO];
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

-(void)save
{
    [self.view endEditing:YES];
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"操作提示：保存成功！" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
		[alert show];
		[NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(dismissAlert:) userInfo:[NSDictionary dictionaryWithObjectsAndKeys:alert, @"alert", @"dismiss ", @"key" ,nil]  repeats:NO];
}

#pragma mark - lazyload
- (NactroHeaderView *)headerView{
	if (!_headerView) {
			_headerView = [[NactroHeaderView alloc]initWithFrame:CGRectMake(0,0,kWidth,HEADER_HEIGHT) tweakName:tweakName devTeamName:@"Nactro Dev." backgroundColor:[UIColor colorWithHexString:@"#3283ec"]];
	}
	return _headerView;
}

@end
