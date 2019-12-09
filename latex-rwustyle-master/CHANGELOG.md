# latex-rwustyle Changelog

## latex-rwustyle-0.3 (2019-11-26)
* Split rwubase package into rwudefs and rwufont, make rwubase include both
* Add more variants for font setup (`fontsetup` option)
* rwudefs: Add optional size parameter to `\rwulogo`
* rwudefs: Add missing `\ProvidesFile` for `rwulogo.eps`
* rwufont: Fix quotation mark font (partially)
* rwufont: Fix undefined commands when used without babel
* rwukoma: Fix TOC, LOF, LOT and page number fonts for `fontsetup` option
* Makefile: Update ls-R files after system-wide (un)install
* README: Add installation instructions for Windows
* Miscellaneous minor fixes in Makefile, examples and documentation

## latex-rwustyle-0.2 (2019-07-15)
* rwukoma: Fix `colorhead=true` with `scrartcl`
* rwukoma: Reduce spacing after section headings
* rwukoma: Fix spacing between numbers and headings in table of contents
* Makefile: Fix TEXINPUTS order when building examples
* Add list of figures to book example
* Miscellaneous minor fixes in examples and documentation

## latex-rwustyle-0.1 (2019-06-26)
First public release
