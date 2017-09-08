.PHONY: init
init: config

.PHONY: config
config:
	macos/config.sh
	git/config.sh
	@echo OK
