# Generate a doc/tags file for each Vim plugin that has a doc/ folder.
# This enables us to read the documentation with the :help command.
.PHONY: doc
doc:
	bin/vim-help-update

.PHONY: update
update:
	bin/vim-plugin-update --all
