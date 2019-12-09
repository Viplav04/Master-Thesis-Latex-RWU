# RWU LaTeX style packages

This project contains RWU LaTeX style packages, using the Barlow font family
and the RWU colors.
It is mainly meant for usage in official RWU documents, like exercise sheets,
lecture notes and forms.

**If you are a student and plan to use these packages in your project
documentation or in your thesis, please talk to your supervising professor
first and ask her or him about the expected style.**
These documents are your work and not necessarily subject to the corporate
design of the RWU.
Furthermore, expected styles differ between professors.

Currently, only the KOMA script document classes `scrartcl`, `scrreprt` and
`scrbook` are fully supported.

For other document classes, it is only possible to use the logo, access the
color definitions and/or switch the font.

Support for `scrlttr2` is planned, but not implemented yet.
Eventually, there also will be a support package for the `beamer` class,
providing the RWU style for presentation slides.

## Features

* Definitions of the colors `rwuviolet`, `rwucyan`, `rwuvioletlight`,
  `rwucyanlight` and `rwucyan40` using the `xcolor` package

* Set the sans serif font to Barlow Semi Condensed

* Several options for the main font, with Barlow Semi Condensed being the
  default

* Simple inclusion of the RWU logo by just using the `\rwulogo` macro

* Optionally set up page head and foot according to the RWU style guide

* Optionally colorize all part, chapter and section headings

## Prerequisites

* A modern LaTeX distribution including `xelatex` (needed for using the
  Barlow Semi Condensed font).

* The Barlow font family has to be installed and to be available to `xelatex`.
  You can find the fonts here: https://github.com/jpt/barlow
  Usually it is sufficient to install them using the regular font installation
  mechanisms of your operating system.
  Debian and Ubuntu users can find a `.deb` package at the
  prj-corporate-design/fonts-barlow> project, while Gentoo users can install
  the `media-fonts/barlow` ebuild from adm-lab-linux/k102-gentoo-overlay>.

## Examples

This project includes several examples in the directory of the same name.
On Unix-like systems, `make examples` can be invoked to create PDF files
from them, to get a preview about what to expect from this style.

## Download and Installation

### Download

Releases are flagged using git tags of the form `latex-rwustyle-*`.
Please have a look at the
[tags page](https://fbe-gitlab.hs-weingarten.de/prj-corporate-design/latex-rwustyle/tags)
to see a list of all releases and for download links.
**Ensure you always download the complete source code as a ZIP or TAR
archive**, just as with every other project on GitLab.

For production, it is recommended to always use the latest release.

### Installation

#### Unix-like systems (Linux, Mac OS, etc.)

On Unix-like systems, after unpacking the release archive, change into its
root directory, which contains a [Makefile](Makefile).
Then, a simple `make install-home` should install all the `*.sty` files and
the logo (`rwulogo.eps`) into a suitable subdirectory of the current user's
local `texmf` tree.
On the author's system, this installs the files into
`/home/stefan/texmf/tex/latex/rwustyle`.

If you want to or have to install the style manually, create a subdirectory
`tex/latex/rwustyle` in your texmf directory and copy all `*.sty` files and
the `rwulogo.eps` file from the `rwustyle` subdirectory into it.

If you are unsure about the location of your local `texmf` directory tree,
you can use the following command to get it for your current user:
```
kpsewhich -var-value=TEXMFHOME
```

It is also possible to do a system-wide installation.
To do so, copy the files into the global `texmf` tree of your LaTeX
installation.
Its path can be obtained by using this command:
```
kpsewhich -var-value=TEXMFLOCAL
```
As an example only, on the author's system, this means the files would go to:
`/usr/local/share/texmf/tex/latex/rwustyle`

For system-wide installation, on Unix-like systems with TexLive,
`make install` should work, too.

#### Windows (with MikTeX)

On Windows, after unpacking the release archive, copy the entire `rwustyle`
directory to the `tex\latex` subdirectory of your LaTeX installation.
For example, if you have MiKTeX 2.9 (installed into the default path),
copy the `rwustyle` directory to: `C:\Program Files\MiKTeX 2.9\tex\latex`.
Ensure that there is a directory `C:\Program Files\MiKTeX 2.9\tex\latex\rwustyle`,
containing all the `*.sty` files and `rwulogo.eps` from this package.

After that, open the MikTeX Console (as admin) via the start menu.
In the menu there, click on `Tasks` and select the item `Refresh file name
database`.
Finally, close the MikTeX Console and you're done.

### Bundling into documents (non-recommended alternative to installation)

Instead of performing an installation, it is also possible to just directly
copy over all files from the `rwustyle` subdirectory into the directory of
your main LaTeX file.

However, please note that this is *not recommended*, as this means that there
will be a copy of the rwustyle files for every document that uses it, which
will make future updates a maintenance nightmare.

## Usage

There are four `*.sty` files, which can be imported with `\usepackage`, just
like any other styles.
Except for `rwudefs.sty`, all packages require that `xelatex` is used instead
of `pdflatex`, as `pdflatex` does not support the `fontspec` package, which is
used internally by the RWU style to set up the font.

**Important:** As these styles redefine some macros from the `babel` package,
they always have to be imported *after* `babel`, i.e.:

```
\usepackage[ngerman]{babel}
\usepackage{rwukoma}
```

### rwudefs.sty

This package defines the RWU colors:

```
\definecolor{rwuviolet}{RGB}{102, 56, 182}
\definecolor{rwuvioletlight}{RGB}{155, 125, 212}
\definecolor{rwucyan}{RGB}{0, 169, 206}
\definecolor{rwucyanlight}{RGB}{5, 195, 222}
\definecolor{rwucyan40}{RGB}{153, 221, 253}
```

You can use them with the usual color macros, for example:
```
\color{rwuviolet}
% Everything from here on is printed in violet color.
\textcolor{rwucyan}{This is printed in cyan color.}
```

Furthermore, the macro `\rwulogo` is defined to render the RWU logo.
By default, the logo has a width of 5.12 cm.
If a different size is needed, the width or the height can be passed
as an optional parameter to the macro:

```
\rwulogo                      % for default size
\rwulogo[width=\columnwidth]  % make the logo fill the whole text column
\rwulogo[height=2cm]          % height is 2cm, width is adjusted automatically
```

The `rwudefs.sty` package does not take any options and should work with
every common document class and all usual other packages, furthermore it
does not require `xelatex`, so it can be used to quickly insert the logo
into existing documents, without changing anything else.
However, it is recommended to migrate existing documents to `rwukoma.sty`
(where possible), to change the overall look into the corporate design of
the RWU.

To use this package, just add `\usepackage{rwudefs}` to the preamble of your
document (after `\usepackage[...]{babel}`, see above).

### rwufont.sty

This package changes the document font to Barlow Semi Condensed.
By default, this affects the sans serif and the main font, yet there are
several variants for the main font, which can be selected by using the
`fontsetup` package option:

* `fontsetup=barlowsc`: Use Barlow Semi Condensed as the main font.
  This is the recommended default.

* `fontsetup=barlow`: Use the wider, non-condensed Barlow font as the
  main font. This might be useful if you consider the semi condensed variant
  to be a little bit too narrow for longer amounts of continuous text.

* `fontsetup=basic`: Only set up the sans serif font.
  This can be used if you want to set up your own main font and is otherwise
  not recommended.

For this package to work, the Barlow font family has to be installed on the
system (see above) and the document has to be processed with `xelatex`
instead of `latex` or `pdflatex`.

The `rwufont.sty` package  should work with most common document classes and
other packages.

To use it, just add `\usepackage{rwufont}` to the preamble of your
document (after `\usepackage[...]{babel}`, see above).
Options can be passed in square brackets, e.g.:
`\usepackage[fontsetup=barlow]{rwufont}`

### rwubase.sty

This is just a convenience package that imports `rwudefs.sty` and
`rwufont.sty`.
Just as these, it does not take any options and should work with most common
document classes and other packages, yet it has the same requirements
as the `rwufont.sty` package, regarding fonts and `xelatex`.

To use it, just add `\usepackage{rwubase}` to the preamble of your
document (after `\usepackage[...]{babel}`, see above).
The `rwubase` package also accepts the `fontsetup=` option and passes it
directly to `rwufont.sty`.

### rwukoma.sty

This package is meant to be used with the KOMA script document classes
`scrartcl`, `scrreprt` and `scrbook`.
It colorizes the title, subtitle, author and date, as well as optionally
part, chapter and section headings.
Furthermore, it sets up the text style for page headers and footers.
Optionally, it also puts a logo into the header and/or sets up the footer
to include the total number of pages.

This package supports the following options:

* `fontsetup=barlowsc|barlow|basic`: Choose a font setup as described
  for `rwufont.sty`. Default is `barlowsc`.

* `head=true|false|auto`: If `true`, set up the page header to include
  the RWU logo on every page using the `scrheadings` pagestyle.
  All other content is cleared from the page header.
  If `false`, do not change the content of the page header.
  If this is set to `auto`, as is the default, then the header is only
  set up if the document class is `scrartcl`.
  The rationale behind this is that it probably does not make too much
  sense to include the logo on every page of a longer document.

* `foot=true|false|auto`: If `true`, set up the page footer to include
  the total number of pages.
  If `false`, do not change the content of the page footer.
  If this is set to `auto`, as is the default, then the footer is only
  set up if the document class is `scrartcl`.
  The rationale behind this is that the pages of longer documents are
  usually bound together tightly, so it should be clear which page is
  the last one.

* `colorhead=true|false`: If `true`, make all headings of parts, chapters
  sections and so on appear violet.
  If `false`, do not change their color.
  The default is `false`.
