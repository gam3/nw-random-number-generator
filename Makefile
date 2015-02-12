

TEX=latex

all : random-number-generator.tex random-number-generator.cpp random-number-generator random-number-generator.dvi random-number-generator.pdf

%.dvi : %.tex
	${TEX} $<
	${TEX} $<

%.pdf : %.tex
	xelatex $<
	xelatex $<

random-number-generator : random-number-generator.cpp

%.tex : %.nw
	sh -c "noweave -delay $< > $@"

%.cpp : %.nw
	sh -c "notangle $< > $@"

