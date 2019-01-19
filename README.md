# *flyptex*
LaTeX library of some useful documentclasses and packages.

[*flyparticle*](#flyparticle-documentclass): space-efficient template to do just about anything.  
[*flypset*](#flypset-documentclass): solve a problem set, create an exam, type up your notes.  
[*flypmacros*](#flypmacros-package): some useful macros.  
[*flypconstants*](#flypconstants-package): physical constant library.


## Dependencies

Per-file dependencies are listed below. If your system is lacking any of these, you'll find them over at [ctan](https://ctan.org). On Debian systems, you can install most packages via apt. Use `apt-file search <latex file>` first to query for the package that contains the desired latex file.

#### [*flyparticle*.cls](flyparticle.cls) requires
* *article*.cls
* *amsmath*.sty, *amssymb*.sty, *amsthm*.sty
* *fullpage*.sty
* *fancyhdr*.sty, *lastpage*.sty
* *scrextend*.sty

#### [*flypset*.cls](flypset.cls) requires
* [*flyparticle*.cls](flyparticle.cls)
* [*flypmacros*.sty](flypmacros.sty)
* *enumerate*.sty, *booktabs*.sty
* *amsthm*.sty

#### [*flypmacros*.sty](flypmacros.sty) requires nothing special!

#### [*flypconstants*.sty](flypconstants.sty) requires
* *siunitx*.sty


## Install

As with all latex packages, simply place .cls and .sty files anywhere within your `texmf/tex/latex` directory and then run

    texhash path/to/texmf
    
to update tex's index of your packages.

Also be sure to have all of the [required packages](#Dependencies) installed.


## Per-file Manuals

Documentation for each file follows. Refer to external package documentation (usually found at [ctan](https://ctan.org)) for anything you'd like to do not mentioned here -- I documented features as I expect them to be used. Arguments are indicated with parentheses, i.e. if there's a command with one parameter, it will be indicated as

    \command{(param)}

and you should replace `(param)` with the relevant value.

### [*flyparticle*](flyparticle.cls) documentclass

It derives from the *article* documentclass. It provides the standard ams packages (*amsmath*, *amssymb*, *amsthm*).

Margins are reduced by *fullpage*.

Headers are configured via *fancyhdr*. The class places the following parameters in the following locations:
* `\title`, top-centre
* `\author`, top-right
* `\date`, lower-centre
* `\namespace`, lower-left (the course, subject, project, etc.)
* as well as "(page) of (pages)", lower-right

These parameters are set to empty strings by default and none of them are required (unlike *article*). You're welcome to change this configuration with *fancyhdr*'s `\fancyhf` command in your preamble. Set `\headheight` (default 15.2pt) and `\headsep` (default 0.1in) to adjust the header's geometry.

The class provides simple indent-nesting of environments via an `addmargin` wrapper. The command

    \makenested{(environment)}

will make a new environment named `nested(environment)` which behaves just as `(environment)` does but increases the left margin within by a certain length. Set length `\nesting` to adjust this margin; its default value is `\parindent`. (Note that currently the resulting `nested(environment)` only supports one parameter, mostly because I haven't needed more. If you'd like to nest an environment which takes more than one parameter, feel free to improve `\makenested` and submit a pull request!)

### [*flypset*](flypset.cls) documentclass

This class is geared towards typesetting problem sets or homework solutions. It derives from [*flyparticle*](#flyparticle-documentclass) and imports [*flypmacros*](#flypmacros-package). It provides *enumerate* and *booktabs* for nice enumeration.

The class implements *amsthm* with two theoremstyles (in addition to the standard ones) and five theorem definitions:
* `problem` (numerically enumerated) (implements `problem` style)
* `problem*` (same except not enumerated) (implements `problem*` style)
* `subproblem` (alphabetical enumeration, heading text removed) (implements `problem` style)
* `proposition` (implements standard `plain` style)
* `discussion` (implements standard `remark` style)

The heading text can be customized in your preamble with these commands:
* `\problemtitle` (default "Problem")
* `\propositiontitle` (default "Proposition")
* `\discussiontitle` (default "Discussion")

Additionally, the following nested environments (see [*flyparticle*'s](#flyparticle-documentclass) `\makenested`) are provided:
* `nestedproblem`
* `nestedproblem*`
* `nestedsubproblem`
