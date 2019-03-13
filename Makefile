GO_EASY_ON_ME = 1
DEBUG = 0
ARCHS = arm64
include $(THEOS)/makefiles/common.mk
SDKVERSION = 11.2
SYSROOT = $(THEOS)/sdks/iPhoneOS11.2.sdk

TWEAK_NAME = blurskiller
blurskiller_FILES = blurskiller.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += blurskillersettings
include $(THEOS_MAKE_PATH)/aggregate.mk
