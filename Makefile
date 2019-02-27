GO_EASY_ON_ME = 1
ARCHS = arm64
include $(THEOS)/makefiles/common.mk
export SDKVERSION= 12.1.2

TWEAK_NAME = blurskiller
blurskiller_FILES = blurskiller.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += blurskillersettings
include $(THEOS_MAKE_PATH)/aggregate.mk
