.PHONY: help

ROOTPATH := $(shell pwd)
SWIFTLINT := $(shell command -v swiftlint 2>/dev/null)

run:
	cd Example && pod install --no-repo-update --verbose
	open Example/*.xcworkspace/

test:
	SCHEMES=( $(xcodebuild -workspace */*.xcworkspace -list 2>/dev/null | sed '1,/Schemes:/d' | grep -v CordovaLib | sed -e 's/^[ \t]*//') )
	echo $SCHEMES

swift_lint:
	$(info swift lint ...)
ifeq ($(SWIFTLINT),)
	$(warning warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint.)
else
	$(SWIFTLINT) --path */Classes --config $(ROOTPATH)/.swiftlint.yml
endif

pod_lint:
	pod lib lint --allow-warnings --verbose

pod_deploy:
	pod trunk push *.podspec --allow-warnings --verbose

help: 
	@echo targes:  run, swift_lint, pod_lint, pod_deploy

