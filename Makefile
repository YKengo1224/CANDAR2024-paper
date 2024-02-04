MAIN_TEX     :=main.tex
TEX_DIR      :=src
TEX_FILES    :=$(wildcard $(TEX_DIR)/*.tex)
ALL_TEX_FILES:=$(TEX_FILES) $(MAIN_TEX)
BUILD_DIR    :=build
PDF          :=$(BUILD_DIR)/main.pdf
RELEASE_DIR  :=release
RELEASE      :=$(RELEASE_DIR)/release_$(shell date "+%Y%m%d%H%M%S").pdf

##
## Tools
##
LATEXMK   := latexmk
PDFVIEWER := evince
MKDIR     := mkdir -p
RM        := rm -rf
CP        := cp -rf

##
## PANDOC
##
TOP_LEVEL:=section
###

.PHONY: all release view info help rebuild

##
## Commnads
##

all: view

rebuild: distclean build ## rebuild


view: $(PDF) ## show pdf
	${PDFVIEWER} $(PDF) &

build : $(PDF)  ## build pdf

release: rebuild ## release pdf
	mkdir -p release
	cp -rf $(PDF) $(RELEASE)

info: ## show info
	@echo $(TEX_DIR)
	@echo $(TEX_FILES)
	@echo $(MD_FILES)
	@echo $(RELEASE)

$(TEX_DIR):
	mkdir -p $@

$(PDF): $(ALL_TEX_FILES)
	$(LATEXMK)

clean: ## clean project
	$(RM) */*~ *~

distclean: clean ## clean entire project
	$(RM) $(BUILD_DIR) 

help:   ## Print help for Makefile.
	@printf "\033[36m%-20s\033[0m %s\n" "[Command]" "[Description]"
	@grep -E '^[a-zA-Z_-]+:.*?##.*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


.DEFAULT_GOAL := help

