[brumaltex3]
==========

A latex package used by abstrnoah.

This package has had three iterations. Each iteration, I have essentially
started over, so no cross-compatibility is guaranteed. Maybe they shouldn't be
considered versions of the same package.
Each iteration aims to be increasingly stable and useful to people aren't me.
That said, it's a personal package, so quite ___unstable___ and insufficiently
documented. Let me know if you find its contents useful and I'd be happy to
maintain it better.

For "official" documentation, see docstrings in the source code (they are
usually pretty good but, still, sorry).

In general, command names are prefixed `\brt...` to avoid conflicts. The only
exception to this is the `shorthand` module (see [below](#modules)).

## dependencies

The package tries to limit dependencies to mainstream packages. I use the
[tectonic] latex engine and occasionally [Overleaf]. Both platforms are able to
provide [brumaltex3]'s dependencies as of January 2024.

Core dependencies:
 
* expl3
* xparse
* amsmath
* amssymb
* amsthm
* mathtools
* physics
    * Single most useful latex package I have ever found.
* csquotes
    * For quotes, use
      `\enquote{Quoted text}`
      instead of
      <code>``Quoted text''</code>.
* mathrsfs
* stmaryrd
* dsfont
* bm

A few modules require additional packages (only if loaded); see below.

For more information on any of these packages, head over to [ctan].

## modules

The package is modular.
Modules are loaded like
```latex
\usepackage[comma,
            separated,
            module,
            names,
            in-any-order,
            duplicates-are-okay]
           {brumaltex3}
```

Modules are declared in the source code as
```latex
\brt_declare_module:nnn {module-name} ...
```

Modules that are loaded by default (and there is no way to prevent them from
loading):

* `module`
    * This isn't actually a module. But the package provides some machinery
      beyond the builtin `\DeclareOption` for bootstrapping the module system.
      The two main features I wanted that I wasn't sure I could easily guarantee
      with builtins: (1) Transitive dependencies between modules. (2) Never ever
      load a module more than once no matter what even if you do something like
      `\ExecuteOptions`.
* `core-external-dependencies`
    * See [above](#dependencies).

Modules that are optional:

* `expl3-library`
    * Some utilities built on top of [expl3].
    * To use, you'll need to use `\ExplSyntaxOn...\ExplSyntaxOff`.
* `breaklessmaths`
    * Never ever break in maths mode.
* `latex3-issue1090-workaround`
    * See <https://github.com/latex3/latex3/issues/1090>.
    * This issue has been fixed in the current version of latex3, but [tectonic]
      doesn't ship that version, so I ship this workaround for maximum
      compatibility.
* `ref`
    * Include packages 'hyperref' and 'cleverref' with some custom options set.
* `biblatex`
    * Include package 'biblatex' with some custom options set.
    * Use `\addbibresource` after loading [brumaltex3] to load your `.bib` file.
* `environments`
    * Provide some common environments via `\newtheorem`.
* `nestedproofs`
    * Change the `proof` environment QED symbol depending on how deeply it is
      nested. 
    * This is done automatically; the user the does not have to do anything
      beyond loading this module and using `proof` as usual.
    * Use `\brtQedSet {\topLevelQed, \secondQed, thirdQed, ...}` to set a custom
      list of QED symbols.
    * See `\brtDefaultQeds` for the default list of qed symbols, which provides
      _six_ levels of nesting.
    * An error will occur if you nest neeper than the number of QED symbols
      passed to `\brtQedSet` (but you really shouldn't be nesting _that_ deeply,
      should you?).
* `longhand`
    * Useful macros for document authors (mostly mathematical).
    * All macros have long, self-descriptive names prefixed by `\brtLH...`; the
      user could bind their own shorthand commands to these.
* `shorthand`
    * My own shorthand bindings to `longhand` macros.
    * Beware. I make zero effort to avoid conflicts with common names. I
      probably redefine your favourite command.

---

[brumaltex3]: https://github.com/abstrnoah/brumaltex
[functional]: https://ctan.org/pkg/functional
[tectonic]: https://github.com/tectonic-typesetting/tectonic/
[expl3]: https://www.ctan.org/pkg/expl3
[Overleaf]: https://www.overleaf.com
[ctan]: https://ctan.org/
