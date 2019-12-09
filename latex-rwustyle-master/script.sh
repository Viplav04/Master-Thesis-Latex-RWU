#!/usr/bin/env bash



cd examples

rm thesis.nlo thesis.ist thesis.ilg

cd ..

make

makeindex examples/thesis.nlo -s nomencl.ist -o thesis.nls

chmod +x thesis.nls
mv thesis.nls examples

bibtex examples/thesis
mv thesis.bib examples

echo "moved"

make

