
#import "substrate.h"

@interface PSUIAppleAccountCell : UITableViewCell
@end

static BOOL globalTransparent = NO;
static BOOL globalSelfTrans = NO;
static BOOL folderTrans = NO;
static BOOL KBSettings = NO;
static BOOL KBMobilePhone = NO;
static float maskAlpha = 0;
static NSString * wallpaperPath = @"/var/mobile/wallpaper.png";

static void loadPrefs() {
  NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.nactro.blurskillersettings.plist"];
  if (prefs) {
    globalTransparent = ([[prefs objectForKey:@"globalTransparent"] boolValue] ? [[prefs objectForKey:@"globalTransparent"] boolValue] : globalTransparent);
    globalSelfTrans = ([[prefs objectForKey:@"globalSelfTrans"] boolValue] ? [[prefs objectForKey:@"globalSelfTrans"] boolValue] : globalSelfTrans);
    folderTrans = ([[prefs objectForKey:@"folderTrans"] boolValue]?:folderTrans);
    KBSettings = ([[prefs objectForKey:@"KBSettings"] boolValue]?:KBSettings);
    KBMobilePhone = ([[prefs objectForKey:@"KBMobilePhone"] boolValue]?:KBMobilePhone);
    maskAlpha = ([[prefs objectForKey:@"maskAlpha"] floatValue] ?: maskAlpha);
  }
  [prefs release];
}



#pragma mark -全局微透
%hook SBFWallpaperSettings
-(BOOL) replaceBlurs {
	if(globalSelfTrans) {
		return YES;
	} else {
		return %orig;
	}
}
%end

%hook UIDevice
- (long long)_graphicsQuality {
if (globalSelfTrans)
	return 10;
return %orig;
}
%end

@interface _UIBackdropViewSettings : UIView
-(double) grayscaleTintAlpha;
-(id) initWithDefaultValuesForGraphicsQuality:(long long)arg1;
-(double) blurRadius;
-(void) setZoomsBack:(bool)arg1;
@end

#pragma mark -全透
%hook _UIBackdropViewSettings
- (id)initWithDefaultValuesForGraphicsQuality:(long long)qualityBlur {
  if (globalTransparent)
  	return NULL;
  return %orig;
  }
%end

%hook SBSwitcherWallpaperPageContentView
-(id) wallpaperEffectView {
	if(globalTransparent) {
		return NULL;
	} else {
		return %orig;
	}
}
%end

#pragma mark -文件夹透明
%hook SBFolderBackgroundView
-(bool) _hasLowQualityBackground {
	if(folderTrans) {
		return YES;
	} else {
		return %orig;
	}
}

-(id) initWithFrame:(CGRect)arg {
	if(folderTrans) {
		return NULL;
	} else {
		return %orig;
	}
}
%end

%hook _SBIconWallpaperBackgroundProvider
-(void) _updateBackgrounds {
	if(folderTrans) {
		return ;
	} else {
		return %orig;
	}
}
%end

#pragma mark - 获取壁纸
@interface SBFWallpaperView : UIView{}
@end


%hook SBFWallpaperView
- (void)didMoveToWindow {
    %orig;
    if (KBSettings || KBMobilePhone) {
        if (![[NSFileManager defaultManager] fileExistsAtPath:wallpaperPath]) {
            UIView *view = self;
            CGFloat scale = [UIScreen mainScreen].scale;
            UIGraphicsBeginImageContextWithOptions(view.frame.size,NO,scale);
            [view.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *wallpaperImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            [UIImagePNGRepresentation(wallpaperImage) writeToFile:wallpaperPath atomically:YES];
        }
    }
  }
%end




#pragma mark -设置界面
@interface PSSearchController : NSObject
@end

/*--------------------背景透明-------------------*/
%hook PSListController

- (void)viewWillAppear:(BOOL)arg1 {
  %orig(arg1);
  if (KBSettings) {
    UITableView *tableView = MSHookIvar<UITableView *>(self,"_table");
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIImageView *wallpaperView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:wallpaperPath]];
    CGRect screenFrame = [[UIScreen mainScreen] bounds];
    wallpaperView.frame = screenFrame;
    wallpaperView.contentMode = UIViewContentModeScaleAspectFit;
    UIView *darkMaskView = [[UIView alloc] initWithFrame:screenFrame];
    //darkMaskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:alpha];
    darkMaskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:maskAlpha];
    [wallpaperView addSubview:darkMaskView];
    tableView.backgroundView = wallpaperView;
    [darkMaskView release];
    [wallpaperView release];
  }
}

- (id)tableView:(UITableView *)arg1 cellForRowAtIndexPath:(id)arg2 {
  if (KBSettings) {
    UITableViewCell *cell = %orig(arg1,arg2);
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
  }
  else{ return %orig(arg1,arg2); }
}
%end


/*--------------搜索框透明--------------*/
%hook PSSearchController
- (UISearchBar *)searchBar {
  if (KBSettings) {
    UISearchBar *searchBar = %orig;
    for (UIView *subview in searchBar.subviews) {
          for(UIView* grandSonView in subview.subviews){
              if ([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                  grandSonView.alpha = 0.0f;
              }else if([grandSonView isKindOfClass:NSClassFromString(@"UISearchBarTextField")] ){

              }else{
                  grandSonView.alpha = 0.0f;
              }
          }
      }
    return searchBar;
  }
  else { return %orig; }
}
%end


/**********导航栏透明************/
%hook UINavigationController
-(void)viewDidAppear:(BOOL)arg1 {
  if (KBSettings) {
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    // 增加大标题颜色修改
    self.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationBar.tintColor = [UIColor whiteColor];
  }
  %orig(arg1);
}
%end

/********** APPLE账户CELL 描述文字变成白色 ************/
%hook PSUIAppleAccountCell
- (void)layoutSubviews{
  if (KBSettings) {
    UILabel *accountLable = MSHookIvar<UILabel *>(self,"_detailTextLabel");
    accountLable.textColor = [UIColor whiteColor];
  }
  %orig;
}
%end

#pragma mark - 电话界面

/*----------拨号界面透明----------*/
%hook DialerController
- (void)setBackgroundStyle:(long long)arg1 animated:(_Bool)arg2{
  if (KBMobilePhone) {
    UIView *dialerView = MSHookIvar<UIView *>(self,"_dialerView");
    dialerView.backgroundColor = [UIColor clearColor];
  }else{
    %orig(arg1,arg2);
  }
}

%end

%ctor {
  loadPrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.nactro.killblurs.settings/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}
