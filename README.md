# *flyptex*
An alright `\LaTeX` library.

See [installation](#install) below. Individual files are documented in [detail](#per-file-manuals), but here is a quick reference list:

* [*flyparticle.cls*](#flyparticle-class): Subclasses *article.cls*. Use this class for complete flyptex functionality. Imports all of flyptex and provides the flyptex page format.
* [*flypcore.sty*](#flypcore-package): Import this package to use flyptex alongside your own class or preamble. Includes all *flyparticle.cls* functionality except for page formating.
* [*flypset.sty*](#flypset-package-and-class): A library for typing up problem sets, solution sets, quizzes, or examinations.
* [*flypset.cls*](#flypset-package-and-class): Imports *flypset.sty* and subclasses *flyparticle.cls*.
* [*flypch.sty*](flypch.sty): Import chemistry libraries. Is currently just an alias to the comprehensive *mhchem.sty*.
* [*flyplgcy.sty*](flyplgcy.sty): A catchall for legacy macros that are retained for backwards-compatibility. Imported into the core library by default; there will soon be an option to suppress this.

The *flyptex* package was created and is maintained by Noah D. Ortiz, a mathematics major at Caltech, who welcomes you to help improve this library. Feel free to contact him at analyticalnoa@gmail.com.

## Dependencies

Per-file dependencies are listed below. If your system is lacking any of these, you'll find them over at [ctan](https://ctan.org). On Debian systems, you can install most packages via apt. Use `apt-file search (latex file)` first to query for the package that contains the desired latex file.

#### [*flyparticle.cls*](flyparticle.cls) requires
* *flypcore.sty* and its dependencies
* *fullpage.sty*
* *fancyhdr.sty*
* *lastpage.sty*

#### [*flypcore.sty*](flypcore.sty) requires
* *amsmath.sty*, *amssymb.sty*, *amsthm.sty*
* *physics.sty*
* *enumerate.sty*
* *booktabs.sty*
* *siunitx.sty*
* *graphicx.sty*
* *varioref.sty*
* *hyperref.sty*
* *cleveref.sty*
* *scrextend.sty*

#### [*flypset.sty*](flypset.sty) requires
* *flypcore.sty* and its dependencies

#### [*flypset.cls*](flypset.cls) requires
* *flyparticle.cls*
* *flypcore.sty* and its dependencies

#### [*flypch.sty*](flypch.sty) requires
* *mhchem.sty*

## Install

As with all latex packages, simply place .cls and .sty files anywhere within your `texmf/tex/latex` directory and then run

    texhash path/to/texmf

to update the index of your packages.

Also be sure to have all of the [required packages](#Dependencies) installed.


## Per-file Manuals

Documentation for each file follows. Refer to external package documentation (usually found at [ctan](https://ctan.org)) for more elaborate documentation of external packages.

### [*flypcore*](flypcore.sty) package

Provides the packages listed in [Dependencies](#Dependencies).

*siunitx* is loaded with *accepted*, *prefixed*, and *abbr* for additional functionality. Reference support is extended with *varioref*, *hyperref*, and *cleveref*, loaded in that order. Trial and error indicates that this sequence avoids most conflicts. *hyperref* is setup to colour links blue. *cleveref* is loaded with *nameinlink*. Use `\Vref` or `\vref` for full combined functionality.

Provides simple indent-nesting of environments via an `addmargin` wrapper. The command

    \makenested{someenvironment}

will make a new environment named `nestedsomeenvironment` which behaves just as `someenvironment` does but increases the left margin within by a certain length. Set length `\nesting` to adjust this margin; its default value is `\parindent`.

The `\df{important term}` command provides emphasis, intended for newly-defined terms. I use this in typing up mathematics notes. By default, this is an alias for boldfacing; redefine as you wish. The `\conclude` command is offered to indicate conclusions to environments other than proofs with a black left triangle (customizability coming soon). I use this to conclude definitions and postulates.

The `defn`, `post`, `thm`, and `prop` environments come pre-defined. The numbering of the first three are set to follow the section counter; you'll need to modify counters to change this (better documentation of this coming soon). `prop` numbering is independent. By default, environments are named as follows
* `defn`: "Defn"
* `post`: "Postulate"
* `thm`: "Thm"
* `prop`: "Proposition"

(The interface for changing these names seems to be messing up how *varioref* works in this last update of flyptex, so names are hard coded until a fix is found.)

The core library provides the following mathematics macros:
* `\Span`, `\dom`, `\ran`, `\Rank`, `\cof`, `\diag`, `\image`, `\smallo`, `\bigo`.
* `\intl`: alias for `\int\limits`.
* `\recipr`: is `\frac` but with the arguments exchanged.
* `\qsuchthat` uses *physics* to print `\quad\text{s.t.}\quad` in math mode.
* `\abqty`: places angle brackets around its argument.
* `\sset`: alias for `\mathbb`, use to denote black board bold sets.
* `\vec`: alias for *physics*' `\vb*` macro, which supports bold Greek letters.
* `\amat`: an amateur augmented matrix (better one coming soon); first argument is in the form {c...c|c} where c appears as many times as you want columns and the bar appears where you want vertical lines; second argument is the matrix.

### [*flyparticle*](flyparticle.cls) class

This class derives from the *article* class.

In addition to loading the core library, flyparticle formats the page as follows.

Margins are made reasonable with *fullpage*.

Headers are configured via *fancyhdr*. The class places the arguments of the following commands (defined in your preable) in the following locations:
* `\title`, top-centre
* `\author`, top-right
* `\date`, lower-centre
* `\namespace`, lower-left (the course, subject, project, etc.)
* as well as "(page) of (pages)", lower-right

These parameters are set to empty strings by default and none of them are required. You're welcome to change this configuration with *fancyhdr*'s `\fancyhf` command in your preamble. Set `\headheight` (default 15.2pt) and `\headsep` (default 0.1in) to adjust the header's geometry.

### *flypset* [package](flypset.sty) and [class](flypset.cls)

This library is geared towards typesetting problem sets or homework solutions or exams and the like. The class of the same name simply subclasses *flyparticle* and loads *flypset.sty*.

Provides problem environments: `problem`, `problem*`, and `subproblem`. Also included are the nested versions of these environments (`nestedproblem`, etc.); see [*flypcore*](#flypcore-package) for nesting. The default problem name is "Problem", but this can be modified with `\problemtitle{newtitle}`. The starred version of `problem` omits the automatic problem number. You can specify the number with the optional argument, e.g. `\begin{problem}[P1.2]` this is useful when you have problems with non-sequential or non-standard numbers such as "QP2" or "23-5". The `subproblem` is alphabetically enumerated and has no title text.

Provides the `soln` environment, named "Solution", which is similar to amsthm's `proof`, but the QED symbol is omitted (customizability coming soon) and there is a return before the first line of text.
