BRUMALTEX
=========

A compilation of LaTeX packages and macros used by abstractednoah.

NOTES
-----

The author uses the
[`tectonic`](https://github.com/tectonic-typesetting/tectonic/) LaTeX engine,
which aims to replicate the behavior of XeLaTeX and require only the TeXLive
distribution. Any packages that brumaltex requires but that tectonic doesn't
support (none at the moment) will be shipped with this package.

The `develop` branch of this repository may be experimental, but `master` has
been tested with `tectonic`. Please post to Issues if you find a bug! If you fix
a bug or augment the package, consider submitting a PR.

For simplicity, the brumaltex package is shipped as a standalone file (in the
sense that its only current dependencies are provided by `tectonic`, see above).
This makes sharing documents that use the package easy (just include this file
alongside your tex file). But it makes it difficult to only use a single feature
of the package without using all the features. For instance, your headers will
be formatted automatically if you use brumaltex. It is a TODO to make this
package modularly configurable on import.

We have attempted to prefix most names introduced in this package by `bt` and
follow `camelCase`. However, the first iteration of the package didn't follow
this convention, and we're still working on migrating over, having to wrestle
with legacy support as well. This convention does not apply to "shorthand"
commands.

OTHER GREAT PACKAGES
--------------------

There are a number of awesome packages that shouldn't be loaded for all
documents but deserve mention anyway:

- `parskip` - A *de facto* default at this point for my less-than-very-format
  documents that delimits paragraphs by vertical skips rather than indents. Look
  a lot cleaner than the default paragraph style, but not appropriate for all
  documents, especially those that need to be conservative about whitespace.
- `biblatex` - For bibliographies.
- `todonotes` - For making in-margin or inline TODO notes.

Another package that deserves mention is the Vim plugin
[`vimtex`](https://github.com/lervag/vimtex): it's a fantastic plugin for
editing LaTeX documents if you use the Vim editor.

TODO
----
- [ ] Modularize and be able to select modules at import.
- [ ] Bolden theorem subtitles.
- [ ] Look into any compiler warnings produced by this package.
