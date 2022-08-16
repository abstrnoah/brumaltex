BRUMALTEX2
==========

A compilation of LaTeX packages and macros used by abstractednoah.

The author uses the
[`tectonic`](https://github.com/tectonic-typesetting/tectonic/) LaTeX engine,
which is able to provide all of this package's dependencies as of this writing.

Version 2 of this package (file `brumaltex2.sty`) is modular, and the modules
are controlled via the option mechanism of `\usepackage`. If a module is named
`name`, then it can be enabled by adding the `name` option and disabled by
prefixing name by `no`, i.e. `noname`. A package can have dependencies, and if a
package is loaded then its dependencies are loaded first. No module is loaded
more than once.

This is a personal package, hence quite ___unstable___ and lacking in
documentation. You'll have to dive into the code to see the different module
definitions (under the section `MODULES %%{1`). There is one module that is
loaded by default, called `default`; you can see the source for which modules
are loaded by `default`. In order to not load `default`, you must specify the
`nodefault` option. I have tried to make the default modules relatively
unobtrusive. In particular, things that modify style/geometry in a substantial
way are grouped into the `page` module and not loaded by default.

The current version of the module system is not ideal. In particular, one cannot
disable a module if it is the dependency of another enabled module, without
disabling the latter. Maybe a better system would be, if a module is disabled,
then all modules that depend on it are also disabled. Anyway, I haven't gotten
around to implementing this.
