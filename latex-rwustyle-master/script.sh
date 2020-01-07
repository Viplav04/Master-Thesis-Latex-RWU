#!/usr/bin/env bash


cd ~/latex-rwustyle-master
cd examples

rm thesis.nlo thesis.ist thesis.ilg thesis.blg thesis.bbl thesis.bib

cd ..

make

makeindex examples/thesis.nlo -s nomencl.ist -o thesis.nls

chmod +x thesis.nls
cp thesis.nls examples

bibtex examples/thesis
cp thesis.bib examples

echo "moved, change something in thesis.tex, save and run make again"



