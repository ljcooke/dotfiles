# Generate a doc/tags file for each plugin that has a doc/ folder.
# This enables us to read the documentation with the :help command.
.PHONY: doc
doc:
	vim -c ':call pathogen#helptags()' +qall
	find pack -type f -name tags
