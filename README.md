# flyptex
LaTeX library of some useful documentclasses and packages.

[flyparticle](flyparticle.cls): space-efficient template to do just about anything.  
[flypset](flypset.cls): solve a problem set, create an exam, type up your notes.  
[flypmacros](flypmacros.sty): some useful macros.  
[flypconstants](flypconstants.sty): physical constant library.

## Dependencies

Per-file dependencies are listed below. If your system is lacking any of these, you'll find them over at [ctan](https://ctan.org). On Debian systems, you can install most packages via apt. Use `apt-file search <latex file>` first to query for the package that contains the desired latex file.

#### [flyparticle.cls](flyparticle.cls) requires
* article.cls
* amsmath.sty, amssymb.sty, amsthm.sty
* fullpage.sty
* fancyhdr.sty, lastpage.sty
* scrextend.sty

#### [flypset.cls](flypset.cls) requires
* [flyparticle.cls](flyparticle.cls)
* [flypmacros.sty](flypmacros.sty)
* enumerate.sty, booktabs.sty
* amsthm.sty

#### [flypmacros.sty](flypmacros.sty) requires nothing special!

#### [flypconstants.sty](flypconstants.sty) requires
* siunitx.sty

## Install

As with all latex packages, simply place .cls and .sty files anywhere within your `texmf/tex/latex` directory and then run

    texhash path/to/texmf
    
to update tex's index of your packages.

Also be sure to have all [Dependencies](#Dependencies) installed.
