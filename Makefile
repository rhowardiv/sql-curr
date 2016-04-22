# from https://gist.github.com/rhowardiv/bb19895617fe0487781d
export SHELL := /bin/bash
.PHONY: default pdf html view clean

SRC = $(wildcard *.txt)
PDFS=$(SRC:.txt=.pdf)
HTML=$(SRC:.txt=.html)

default: pdf html
pdf: $(PDFS)
%.pdf : %.txt
	@pandoc -o $@ $<
html : $(HTML)
%.html : %.txt
	@pandoc -o $@ $<
view : $(PDFS)
	@if [[ "$$(uname)" == "Linux" ]]; then \
		evince $< & \
	else open -a Preview $< & \
	fi
clean : 
	@rm $(PDFS) $(HTML)
