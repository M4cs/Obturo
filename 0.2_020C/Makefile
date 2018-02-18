export ARCHS = arm64
export TARGET = iphone:clang:latest:latest

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = Obturo
Obturo_FILES = main.m PoAppAppDelegate.m PoAppRootViewController.m UIButton+BackgroundColor.m UIColor+ColorExtensions.m
Obturo_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"Imperium\"" || true
