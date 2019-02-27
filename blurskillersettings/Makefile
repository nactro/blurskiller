GO_EASY_ON_ME = 1
ARCHS = arm64
include $(THEOS)/makefiles/common.mk
BlursKillerSettings_CFLAGS += -fobjc-arc
BUNDLE_NAME = BlursKillerSettings
BlursKillerSettings_FILES = BlursKillerRootListController.m NactroCreditOption.m NactroCreditService.m NactroCreditCell.m UIColor+Hex.m UIFont+Extension.m
BlursKillerSettings_INSTALL_PATH = /Library/PreferenceBundles
BlursKillerSettings_FRAMEWORKS = UIKit
BlursKillerSettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BlursKillerSettings.plist$(ECHO_END)
