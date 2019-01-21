# *flyptex*
`\LaTeX` library of some useful documentclasses and packages.

[*flyparticle*](#flyparticle-documentclass): a better, space-efficient article.  
[*flypset*](#flypset-documentclass): typeset a problem set, homework solutions, etc..  
[*flypmacros*](#flypmacros-package): some useful macros.  
[*flypconstants*](#flypconstants-package): physical constants library.


## Dependencies

Per-file dependencies are listed below. If your system is lacking any of these, you'll find them over at [ctan](https://ctan.org). On Debian systems, you can install most packages via apt. Use `apt-file search (latex file)` first to query for the package that contains the desired latex file.

#### [*flyparticle*.cls](flyparticle.cls) requires
* *article*.cls
* *amsmath*.sty, *amssymb*.sty, *amsthm*.sty
* *fullpage*.sty
* *fancyhdr*.sty, *lastpage*.sty
* *scrextend*.sty
* *enumerate*.sty
* *booktabs*.sty
* *xifthen*.sty
* *hyperref*.sty, *varioref*.sty, *cleveref*.sty

#### [*flypset*.cls](flypset.cls) requires
* [*flyparticle*.cls](flyparticle.cls)
* [*flypmacros*.sty](flypmacros.sty)
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

This class derives from the *article* documentclass. It provides the standard ams packages (*amsmath*, *amssymb*, *amsthm*), as well as *enumerate* for nice enumeration, *booktabs* for extended table features, and *xifthen* for conditional support.

Margins are reduced by *fullpage*. Hyperlinks are enabled with *hyperref*, and internal links are set to appear blue, without boxes.

Greatly improved cross-references are provided by *varioref* together with *cleveref* (capitalise and nameinlink options selected). Use `\Vref` and `vref` for full combined functionality.

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

This class is geared towards typesetting problem sets or homework solutions. It derives from [*flyparticle*](#flyparticle-documentclass) and imports [*flypmacros*](#flypmacros-package).

The class implements *amsthm* with two theoremstyles (in addition to the standard ones) and five theorem environments:
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

### [*flypmacros*](flypmacros.sty) package

* `\sset` - alias to `\mathbb`.
* `\suchthat` - prints "s.t." in text mode.
* `\abs` - nice absolute value vertical bars.
* `\paren` - nice parentheses.
* `\angbracs` - left and right angle brackets.
* `\recipr` - identical to `\frac`, except numerator and denominator are swapped.
* `\dleib{(f)}{(t)}` - Leibniz's "d(f)/d(t)" derivative notation.
* `\mprd` - places a nice period while in mathematics mode.
* `\mconj` - created for inserting "and", "or", etc. within mathematics mode, with lots of space on either side. E.g.
  > <pre> (some cool maths)    and    (some more maths) </pre>
* `\vec` - boldfaced vector (no arrow).
* `\hat` - boldfaced unit vecor (carrot atop).

### [*flypconstants*](flypconstants.sty) package

Provides a library of physical constants, given to known precision as of Jan 2019 in scientific notation with *siunitx* package.

(This is yet a meager list -- feel free to add to it and submit a pull request!)

Refer to the [file](flypconstants.sty) itself for the list. Macro names use the following conventions:
* `\(symbol)(unit)`, where "SI" refers to standard SI units.
* `\(symbol)dig` - the quantity without order of magnitude (i.e. scientific notation with power-of-ten omitted.
* `\(symbol)val` - the quantity given without units.
