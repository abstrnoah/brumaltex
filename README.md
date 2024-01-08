brumaltex
=========

A compilation of LaTeX packages and macros used by abstrnoah.

With each version, I try to make it increasingly useful to people who aren't me
(mainly because I want to be able to use it for collaborative projects). That
said, it is a personal package and, as such, quite ___unstable___,
insufficiently documented, and probably forever.

The author uses the [tectonic] LaTeX engine, which is able to provide all of
this package's dependencies as of this writing.

In general, the major versions below are _not_ cross-compatible. In fact, I tend
to increment the version number when I scrap everything and start over, so they
really should be thought of as different packages.

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

The main goal of Version 3 is to provide a "formattable types" system, whereby
the user classify their mathematical objects and specify how the objects are
formatted based on the object's type.

For a saner programming experience, we make use of the [functional] package
which, in turn, wraps [expl3]. Despite its name, [functional] does not provide a
truly functional interface, as it requires the user to manage resource
allocation. However, [functional] does solve the problem of expansion order (no
small feat). That is, [functional] makes it possible to define functions whose
arguments are evaluated before the function is executed.

To solve the resource allocation problem without wanting to implement
`malloc` in LaTeX, we take a very dumb approach: Each datatype `T`
provides a `\brtTMake` function which takes a "literal" (a token-list
representation of the datatype), constructs an instance of the datatype, binds
it to a fresh constant, and passes the constant along. We make zero effort to
reuse resources, simply incrementing a counter every time a constructor is
called. Obviously this comes at a performance cost, but I don't care. Some day I
might make it better. But if you really care about performance, you should just
use [functional] or [expl3].

A consequence of this implementation is what we call "abstract datatypes"
are actually just an [expl3] constants, so you can manipulate them as you wish
with the appropriate [functional] or [expl3] utilities.

Naming conventions:
* Except in the `shorthands` module, for each module `mod`, user-facing macros
  of that module have the prefix `\brtMod...`, with the rest of the name
  following CamelCase.
* The `shorthands` module aims to be convenient for me (the author) and has no
  formal naming conventions. It probably redefines your favourite macros.

## fmtype

The `fmtype` module is an attempt to implement a primitive system of formattable
types. I'm not going to attempt to implement a full-fledged system of checked,
algebraic types. The system will not enforce type safety. Maybe it shouldn't
even be called a type system. The main goal is flexible, consistent, and easy
formatting of mathematical objects.

Here's the idea: The user may declare a universe of _objects_, each of which has
a _type_. Objects are simply _property lists_. The user may specify
_formatters_, which are functions that take objects and typeset them. The
formatter for the distinguished object `type` takes highest precedent, but can
be overridden by a given type's formatter, which can in turn be overridden by a
given instance's formatter. Formatters may make use of an object's raw property
list or other formatters.

Normative terms:
* "_Must_" means that behaviour is undefined if the condition is not met.
* There are no other normative terms; what do you think this is, an RFC?

An __object__ is just a property list.

__Reserved properties__ are:
* `@type=` - The string name of the object's type.
* `@name=` - The string name of the instance, which _must_ be unique.
* `@fmt=` - A user-defined function of one argument that receives an object and
  formats it.
    * It is up to the user to ensure that the assumptions of this function are
      met by the instances passed to it. The package provides zero mechanisms
      for checking that instances have certain properties.

There is always an object called `@name=type`. By default, `type.@fmt` is a
formatter that simply prints an object's underlying property list verbatim, but
it may be overridden.

A __type__ `T` is an object of `@type=type`. By default, `T.@fmt` is equal to
`type.@fmt`, which the user may override.

An __instance__ `x` of a type `T` is an object with `@type=T` and possibly other
properties, the sanity of which the package provides no mechanism for checking.
By default, `x.@fmt` is equal to `T.@fmt`, which the user may override.

## datatypes

For more details about these data types, see functional's documentation. The
goal of these wrappers is to make the interface actually functional. That is,
functions do not act on variables (they actually do, just not from the
perspective of the user), so the user doesn't have to juggle resources. This
comes at a performance cost, but the author doesn't care.

The idea is that the _coder_ only ever works with _token lists_, but that
functions should pass around instances of abstract datatypes. To contend with
this, we provide functions `\brt{Str,List,Obj}Make` which takes a token list and
returns an abstract instance of the given type. If one really wishes to bind a
variable, we provide a `\brtLet` mechanism for local bindings via property list.

The rest of the functions deal
exclusively with the abstract instances.

## str


## list

## obj

# scratch
* objects are addressable by name



[functional]: https://ctan.org/pkg/functional
[tectonic]: https://github.com/tectonic-typesetting/tectonic/
[expl3]: https://www.ctan.org/pkg/expl3
