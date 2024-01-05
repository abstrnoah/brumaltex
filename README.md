brumaltex
=========

A compilation of LaTeX packages and macros used by abstractednoah.

The author uses the
[`tectonic`](https://github.com/tectonic-typesetting/tectonic/) LaTeX engine,
which is able to provide all of this package's dependencies as of this writing.

# v2

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

# v3

Version 3 is an attempt to implement a primitive type system. I'm not going to
attempt to implement a full-fledged system of checked, algebraic types. The
system will not enforce type safety. Maybe it shouldn't even be called a type
system.

But here's the idea: The user may declare a universe of _objects_, each of which
has a _type_. Objects are simply _property lists_. The user may specify
_formatters_, which are functions that take objects and typeset them. The
formatter for the distinguished object `type` takes highest precedent, but can
be overridden by a given type's formatter, which can in turn be overridden by a
given instance's formatter. Formatters may make use of an object's raw property
list or other formatters.

Normative terms:
* _must_ - Behaviour is undefined if the condition is not met.
* There are no other normative terms, what do you think this is, an RFC?

An __object__ is just a property list.

__Reserved properties__ are:
* `@type=` - The string name of the object's type.
* `@name=` - The string name of the instance (_must_ be unique).
* `@fmt=` - A user-defined function of one argument that receives an object and
  formats it.
    * It is up to the user to ensure that the assumptions of this function are
      met by the instances passed to it. The package provides zero mechanisms
      for checking that instances have certain properties.

There is always an object called `@name=type`, which may include a `@fmt=`
property.

A __type__ `T` is an object of `@type=type`. By default, `T.@fmt` is equal to
`type.@fmt`, which the user may override.

An __instance__ `x` of a type `T` is an object with `@type=T` and possibly other
properties, the sanity of which the package provides no mechanism for checking.
By default, `x.@fmt` is equal to `T.@fmt`, which the user may override.

If the formatter of an instance `x` of type `T` is unspecified (i.e., neither
`type`, `T`, nor `x` provides a `@fmt=` property), then the instance's
underlying property list is typeset verbatim.
