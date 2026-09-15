.PHONY: help publish-all publish-htmleez publish-htmdart publish-htmleez-static

help:
	@printf "Available targets:\n"
	@printf "  make publish-all\n"
	@printf "  make publish-htmleez\n"
	@printf "  make publish-htmdart\n"
	@printf "  make publish-htmleez-static\n"

publish-htmleez:
	dart pub -C packages/htmleez publish --skip-validation

publish-htmdart:
	dart pub -C packages/htmdart publish --skip-validation

publish-htmleez-static:
	dart pub -C packages/htmleez_static publish --skip-validation

publish-all: publish-htmleez publish-htmdart publish-htmleez-static

.DEFAULT_GOAL := help
