update_home:
	bin/update_home

init:
	git submodule init
	git submodule update
	git submodule status
