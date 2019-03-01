#line 1 "blurskiller.xm"

#import "substrate.h"

@interface PSUIAppleAccountCell : UITableViewCell
@end

static BOOL globalTransparent = NO;
static BOOL globalSelfTrans = NO;
static BOOL folderTrans = NO;
static BOOL KBSettings = NO;
static BOOL KBMobilePhone = NO;
static float maskAlpha = 0;
static BOOL KBDarkText = NO;
static NSString * kWallpaperPath = @"/var/mobile/wallpaper.png";

static void loadPrefs() {
  NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.nactro.blurskillersettings.plist"];
  if (prefs) {
    globalTransparent = ([[prefs objectForKey:@"globalTransparent"] boolValue] ? [[prefs objectForKey:@"globalTransparent"] boolValue] : globalTransparent);
    globalSelfTrans = ([[prefs objectForKey:@"globalSelfTrans"] boolValue] ? [[prefs objectForKey:@"globalSelfTrans"] boolValue] : globalSelfTrans);
    folderTrans = ([[prefs objectForKey:@"folderTrans"] boolValue]?:folderTrans);
    KBSettings = ([[prefs objectForKey:@"KBSettings"] boolValue]?:KBSettings);
    KBMobilePhone = ([[prefs objectForKey:@"KBMobilePhone"] boolValue]?:KBMobilePhone);
    maskAlpha = ([[prefs objectForKey:@"maskAlpha"] floatValue] ?: maskAlpha);
    KBDarkText = ([[prefs objectForKey:@"KBDarkText"] boolValue] ?: KBDarkText);
  }
  [prefs release];
}




#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class _UIBackdropViewSettings; @class SBFWallpaperView; @class SBSwitcherWallpaperPageContentView; @class PSListController; @class UINavigationController; @class SBFWallpaperSettings; @class DialerController; @class _SBIconWallpaperBackgroundProvider; @class PSUIAppleAccountCell; @class PSSearchController; @class UIDevice; @class SBFolderBackgroundView; 
static BOOL (*_logos_orig$_ungrouped$SBFWallpaperSettings$replaceBlurs)(_LOGOS_SELF_TYPE_NORMAL SBFWallpaperSettings* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$SBFWallpaperSettings$replaceBlurs(_LOGOS_SELF_TYPE_NORMAL SBFWallpaperSettings* _LOGOS_SELF_CONST, SEL); static long long (*_logos_orig$_ungrouped$UIDevice$_graphicsQuality)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static long long _logos_method$_ungrouped$UIDevice$_graphicsQuality(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static _UIBackdropViewSettings* (*_logos_orig$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$)(_LOGOS_SELF_TYPE_INIT _UIBackdropViewSettings*, SEL, long long) _LOGOS_RETURN_RETAINED; static _UIBackdropViewSettings* _logos_method$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$(_LOGOS_SELF_TYPE_INIT _UIBackdropViewSettings*, SEL, long long) _LOGOS_RETURN_RETAINED; static id (*_logos_orig$_ungrouped$SBSwitcherWallpaperPageContentView$wallpaperEffectView)(_LOGOS_SELF_TYPE_NORMAL SBSwitcherWallpaperPageContentView* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$SBSwitcherWallpaperPageContentView$wallpaperEffectView(_LOGOS_SELF_TYPE_NORMAL SBSwitcherWallpaperPageContentView* _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$_ungrouped$SBFolderBackgroundView$_hasLowQualityBackground)(_LOGOS_SELF_TYPE_NORMAL SBFolderBackgroundView* _LOGOS_SELF_CONST, SEL); static bool _logos_method$_ungrouped$SBFolderBackgroundView$_hasLowQualityBackground(_LOGOS_SELF_TYPE_NORMAL SBFolderBackgroundView* _LOGOS_SELF_CONST, SEL); static SBFolderBackgroundView* (*_logos_orig$_ungrouped$SBFolderBackgroundView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT SBFolderBackgroundView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static SBFolderBackgroundView* _logos_method$_ungrouped$SBFolderBackgroundView$initWithFrame$(_LOGOS_SELF_TYPE_INIT SBFolderBackgroundView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$_SBIconWallpaperBackgroundProvider$_updateBackgrounds)(_LOGOS_SELF_TYPE_NORMAL _SBIconWallpaperBackgroundProvider* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_SBIconWallpaperBackgroundProvider$_updateBackgrounds(_LOGOS_SELF_TYPE_NORMAL _SBIconWallpaperBackgroundProvider* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBFWallpaperView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL SBFWallpaperView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBFWallpaperView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SBFWallpaperView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$PSListController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL PSListController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$PSListController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL PSListController* _LOGOS_SELF_CONST, SEL, BOOL); static id (*_logos_orig$_ungrouped$PSListController$tableView$cellForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL PSListController* _LOGOS_SELF_CONST, SEL, UITableView *, id); static id _logos_method$_ungrouped$PSListController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL PSListController* _LOGOS_SELF_CONST, SEL, UITableView *, id); static UISearchBar * (*_logos_orig$_ungrouped$PSSearchController$searchBar)(_LOGOS_SELF_TYPE_NORMAL PSSearchController* _LOGOS_SELF_CONST, SEL); static UISearchBar * _logos_method$_ungrouped$PSSearchController$searchBar(_LOGOS_SELF_TYPE_NORMAL PSSearchController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UINavigationController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL UINavigationController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$UINavigationController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL UINavigationController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$PSUIAppleAccountCell$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL PSUIAppleAccountCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$PSUIAppleAccountCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL PSUIAppleAccountCell* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$DialerController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL DialerController* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$DialerController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL DialerController* _LOGOS_SELF_CONST, SEL, _Bool); 

#line 32 "blurskiller.xm"
#pragma mark -全局微透

static BOOL _logos_method$_ungrouped$SBFWallpaperSettings$replaceBlurs(_LOGOS_SELF_TYPE_NORMAL SBFWallpaperSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if(globalSelfTrans) {
		return YES;
	} else {
		return _logos_orig$_ungrouped$SBFWallpaperSettings$replaceBlurs(self, _cmd);
	}
}



static long long _logos_method$_ungrouped$UIDevice$_graphicsQuality(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
if (globalSelfTrans)
	return 10;
return _logos_orig$_ungrouped$UIDevice$_graphicsQuality(self, _cmd);
}


@interface _UIBackdropViewSettings : UIView
-(double) grayscaleTintAlpha;
-(id) initWithDefaultValuesForGraphicsQuality:(long long)arg1;
-(double) blurRadius;
-(void) setZoomsBack:(bool)arg1;
@end

#pragma mark -全透

static _UIBackdropViewSettings* _logos_method$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$(_LOGOS_SELF_TYPE_INIT _UIBackdropViewSettings* __unused self, SEL __unused _cmd, long long qualityBlur) _LOGOS_RETURN_RETAINED {
  if (globalTransparent)
  	return NULL;
  return _logos_orig$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$(self, _cmd, qualityBlur);
  }



static id _logos_method$_ungrouped$SBSwitcherWallpaperPageContentView$wallpaperEffectView(_LOGOS_SELF_TYPE_NORMAL SBSwitcherWallpaperPageContentView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if(globalTransparent) {
		return NULL;
	} else {
		return _logos_orig$_ungrouped$SBSwitcherWallpaperPageContentView$wallpaperEffectView(self, _cmd);
	}
}


#pragma mark -文件夹透明

static bool _logos_method$_ungrouped$SBFolderBackgroundView$_hasLowQualityBackground(_LOGOS_SELF_TYPE_NORMAL SBFolderBackgroundView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if(folderTrans) {
		return YES;
	} else {
		return _logos_orig$_ungrouped$SBFolderBackgroundView$_hasLowQualityBackground(self, _cmd);
	}
}

static SBFolderBackgroundView* _logos_method$_ungrouped$SBFolderBackgroundView$initWithFrame$(_LOGOS_SELF_TYPE_INIT SBFolderBackgroundView* __unused self, SEL __unused _cmd, CGRect arg) _LOGOS_RETURN_RETAINED {
	if(folderTrans) {
		return NULL;
	} else {
		return _logos_orig$_ungrouped$SBFolderBackgroundView$initWithFrame$(self, _cmd, arg);
	}
}



static void _logos_method$_ungrouped$_SBIconWallpaperBackgroundProvider$_updateBackgrounds(_LOGOS_SELF_TYPE_NORMAL _SBIconWallpaperBackgroundProvider* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if(folderTrans) {
		return ;
	} else {
		return _logos_orig$_ungrouped$_SBIconWallpaperBackgroundProvider$_updateBackgrounds(self, _cmd);
	}
}


#pragma mark - 获取壁纸
@interface SBFWallpaperView : UIView{}
@end



static void _logos_method$_ungrouped$SBFWallpaperView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SBFWallpaperView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$SBFWallpaperView$didMoveToWindow(self, _cmd);
    if (KBSettings || KBMobilePhone) {
        if (![[NSFileManager defaultManager] fileExistsAtPath:kWallpaperPath]) {
            UIView *view = self;
            CGFloat scale = [UIScreen mainScreen].scale;
            UIGraphicsBeginImageContextWithOptions(view.frame.size,NO,scale);
            [view.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *wallpaperImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            [UIImagePNGRepresentation(wallpaperImage) writeToFile:kWallpaperPath atomically:YES];
        }
    }
  }





#pragma mark -设置界面
@interface PSSearchController : NSObject
@end




static void _logos_method$_ungrouped$PSListController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL PSListController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
  _logos_orig$_ungrouped$PSListController$viewWillAppear$(self, _cmd, arg1);
  if (KBSettings) {
    UITableView *tableView = MSHookIvar<UITableView *>(self,"_table");
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIImageView *wallpaperView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:kWallpaperPath]];
    CGRect screenFrame = [[UIScreen mainScreen] bounds];
    wallpaperView.frame = screenFrame;
    wallpaperView.contentMode = UIViewContentModeScaleAspectFit;
    UIView *darkMaskView = [[UIView alloc] initWithFrame:screenFrame];
    
    darkMaskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:maskAlpha];
    [wallpaperView addSubview:darkMaskView];
    tableView.backgroundView = wallpaperView;
    [darkMaskView release];
    [wallpaperView release];
  }
}

static id _logos_method$_ungrouped$PSListController$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL PSListController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * arg1, id arg2) {
  if (KBSettings) {
    UITableViewCell *cell = _logos_orig$_ungrouped$PSListController$tableView$cellForRowAtIndexPath$(self, _cmd, arg1,arg2);
    cell.backgroundColor = [UIColor clearColor];
    if (KBDarkText) {
      cell.textLabel.textColor = [UIColor blackColor];
    }else{
      cell.textLabel.textColor = [UIColor whiteColor];
    }
    return cell;
  }
  else{ return _logos_orig$_ungrouped$PSListController$tableView$cellForRowAtIndexPath$(self, _cmd, arg1,arg2); }
}


















































static UISearchBar * _logos_method$_ungrouped$PSSearchController$searchBar(_LOGOS_SELF_TYPE_NORMAL PSSearchController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if (KBSettings) {
    UISearchBar *searchBar = _logos_orig$_ungrouped$PSSearchController$searchBar(self, _cmd);
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
  else { return _logos_orig$_ungrouped$PSSearchController$searchBar(self, _cmd); }
}





static void _logos_method$_ungrouped$UINavigationController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL UINavigationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
  if (KBSettings) {
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    if (KBDarkText) {
      [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
      
      self.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
      self.navigationBar.tintColor = [UIColor blackColor];
    }else{
      [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
      
      self.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
      self.navigationBar.tintColor = [UIColor whiteColor];
    }

  }
  _logos_orig$_ungrouped$UINavigationController$viewDidAppear$(self, _cmd, arg1);
}




static void _logos_method$_ungrouped$PSUIAppleAccountCell$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL PSUIAppleAccountCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  if (KBSettings) {
    UILabel *accountLable = MSHookIvar<UILabel *>(self,"_detailTextLabel");
    if (KBDarkText) {
      accountLable.textColor = [UIColor blackColor];
    }else{
      accountLable.textColor = [UIColor whiteColor];
    }
  }
  _logos_orig$_ungrouped$PSUIAppleAccountCell$layoutSubviews(self, _cmd);
}


#pragma mark - 电话界面



static void _logos_method$_ungrouped$DialerController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL DialerController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1){
  if (KBMobilePhone) {
    UIView *dialerView = MSHookIvar<UIView *>(self,"_dialerView");
    dialerView.backgroundColor = [UIColor whiteColor];
}else{
  _logos_orig$_ungrouped$DialerController$viewWillAppear$(self, _cmd, arg1);
}
}


static __attribute__((constructor)) void _logosLocalCtor_ae8039c0(int __unused argc, char __unused **argv, char __unused **envp) {
  loadPrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.nactro.killblurs.settings/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBFWallpaperSettings = objc_getClass("SBFWallpaperSettings"); MSHookMessageEx(_logos_class$_ungrouped$SBFWallpaperSettings, @selector(replaceBlurs), (IMP)&_logos_method$_ungrouped$SBFWallpaperSettings$replaceBlurs, (IMP*)&_logos_orig$_ungrouped$SBFWallpaperSettings$replaceBlurs);Class _logos_class$_ungrouped$UIDevice = objc_getClass("UIDevice"); MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(_graphicsQuality), (IMP)&_logos_method$_ungrouped$UIDevice$_graphicsQuality, (IMP*)&_logos_orig$_ungrouped$UIDevice$_graphicsQuality);Class _logos_class$_ungrouped$_UIBackdropViewSettings = objc_getClass("_UIBackdropViewSettings"); MSHookMessageEx(_logos_class$_ungrouped$_UIBackdropViewSettings, @selector(initWithDefaultValuesForGraphicsQuality:), (IMP)&_logos_method$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$, (IMP*)&_logos_orig$_ungrouped$_UIBackdropViewSettings$initWithDefaultValuesForGraphicsQuality$);Class _logos_class$_ungrouped$SBSwitcherWallpaperPageContentView = objc_getClass("SBSwitcherWallpaperPageContentView"); MSHookMessageEx(_logos_class$_ungrouped$SBSwitcherWallpaperPageContentView, @selector(wallpaperEffectView), (IMP)&_logos_method$_ungrouped$SBSwitcherWallpaperPageContentView$wallpaperEffectView, (IMP*)&_logos_orig$_ungrouped$SBSwitcherWallpaperPageContentView$wallpaperEffectView);Class _logos_class$_ungrouped$SBFolderBackgroundView = objc_getClass("SBFolderBackgroundView"); MSHookMessageEx(_logos_class$_ungrouped$SBFolderBackgroundView, @selector(_hasLowQualityBackground), (IMP)&_logos_method$_ungrouped$SBFolderBackgroundView$_hasLowQualityBackground, (IMP*)&_logos_orig$_ungrouped$SBFolderBackgroundView$_hasLowQualityBackground);MSHookMessageEx(_logos_class$_ungrouped$SBFolderBackgroundView, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$SBFolderBackgroundView$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$SBFolderBackgroundView$initWithFrame$);Class _logos_class$_ungrouped$_SBIconWallpaperBackgroundProvider = objc_getClass("_SBIconWallpaperBackgroundProvider"); MSHookMessageEx(_logos_class$_ungrouped$_SBIconWallpaperBackgroundProvider, @selector(_updateBackgrounds), (IMP)&_logos_method$_ungrouped$_SBIconWallpaperBackgroundProvider$_updateBackgrounds, (IMP*)&_logos_orig$_ungrouped$_SBIconWallpaperBackgroundProvider$_updateBackgrounds);Class _logos_class$_ungrouped$SBFWallpaperView = objc_getClass("SBFWallpaperView"); MSHookMessageEx(_logos_class$_ungrouped$SBFWallpaperView, @selector(didMoveToWindow), (IMP)&_logos_method$_ungrouped$SBFWallpaperView$didMoveToWindow, (IMP*)&_logos_orig$_ungrouped$SBFWallpaperView$didMoveToWindow);Class _logos_class$_ungrouped$PSListController = objc_getClass("PSListController"); MSHookMessageEx(_logos_class$_ungrouped$PSListController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$PSListController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$PSListController$viewWillAppear$);MSHookMessageEx(_logos_class$_ungrouped$PSListController, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$PSListController$tableView$cellForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$PSListController$tableView$cellForRowAtIndexPath$);Class _logos_class$_ungrouped$PSSearchController = objc_getClass("PSSearchController"); MSHookMessageEx(_logos_class$_ungrouped$PSSearchController, @selector(searchBar), (IMP)&_logos_method$_ungrouped$PSSearchController$searchBar, (IMP*)&_logos_orig$_ungrouped$PSSearchController$searchBar);Class _logos_class$_ungrouped$UINavigationController = objc_getClass("UINavigationController"); MSHookMessageEx(_logos_class$_ungrouped$UINavigationController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$UINavigationController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$UINavigationController$viewDidAppear$);Class _logos_class$_ungrouped$PSUIAppleAccountCell = objc_getClass("PSUIAppleAccountCell"); MSHookMessageEx(_logos_class$_ungrouped$PSUIAppleAccountCell, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$PSUIAppleAccountCell$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$PSUIAppleAccountCell$layoutSubviews);Class _logos_class$_ungrouped$DialerController = objc_getClass("DialerController"); MSHookMessageEx(_logos_class$_ungrouped$DialerController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$DialerController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$DialerController$viewWillAppear$);} }
#line 299 "blurskiller.xm"
