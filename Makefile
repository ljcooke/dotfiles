.PHONY: init
init: config

.PHONY: config
config:
	macos/config.sh
	git/config.sh
	sublime/config.sh
	@echo OK
