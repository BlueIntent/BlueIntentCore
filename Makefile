SHELL := /bin/bash
.PHONY: help 

ROOTPATH := $(shell pwd)
XCHELPER := $(shell command -v xchelper 2>/dev/null)

install_xchelper:
	$(info install xchelper ...)
ifeq ($(XCHELPER),)
	$(eval TMP_DIR=$(shell mktemp -d -t xchelper))
	curl -fsSL 'https://raw.githubusercontent.com/BlueIntent/xchelper/main/scripts/install.sh' > "$(TMP_DIR)/install.sh"
	sh "$(TMP_DIR)/install.sh"
	rm -rf $(TMP_DIR)
else
	$(info xchelper, skipping.)
endif

run: \
	install_xchelper
	xchelper run

test: \
	install_xchelper
	xchelper test

swift_lint:
	swiftlint --path */Classes --config $(ROOTPATH)/.swiftlint.yml

pod_lint:
	pod lib lint --allow-warnings --verbose

pod_deploy:
	pod trunk push *.podspec --allow-warnings --verbose

help: 
	@echo targes: run, test, swift_lint, pod_lint, pod_deploy

.DEFAULT_GOAL := run