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

The main goal of Version 3 is to provide a "formattable objects" system, whereby
the user may classify their mathematical objects and specify how the objects are
formatted based on the object's type.

For a saner programming experience, we make use of the [functional] package
which, in turn, wraps [expl3]. Despite its name, [functional] does not provide a
truly functional interface, as it requires the user to manage resource
allocation. However, [functional] does solve the problem of expansion order (no
small feat). That is, [functional] makes it possible to define functions whose
arguments are evaluated before the function is executed.

To solve the resource allocation problem without wanting to implement `malloc`
in LaTeX, we take a very dumb approach: Each new object is assigned to a new
constant, simply incrementing a counter with each allocation. We make zero
effort to reuse resources. Obviously this comes at a performance cost, but I
don't care. Some day I might make it better. But if you really care about
performance, you should just use [functional] or [expl3].

A consequence of our implementation is that our "objects" are actually just
[expl3] property lists, so you can technically manipulate them with [expl3] and
friends.

Naming conventions:
* Except in the `shorthands` module, macros begin with the prefix `\brt...`,
  followed by CamelCase, usually of the form `\brtTypeVerb`.
* The `shorthands` module aims to be convenient for me (the author) and has no
  formal naming conventions. It probably redefines your favourite macros.

## obj

The "objects" module wraps [functional] with the goals of (1) supporting a
uniform datatype library (i.e. all objects are the same kind of thing and can
be manipulated via a simple interface) and (2) providing a convenient formatting
system.

Goal (1) is a necessity for any sane programming language. Goal (2) aims to
vastly improve the typesetting experience for large projects with many
mathematical objects of various types. The hope is that the package makes it
easeir to typeset your favourite mathemematical objects consistently and with
ease.

The main functions are documented below (for some more, see the source code,
where I attempt to maintain reasonably good docstrings ;).

Some important things to keep in mind before diving in:
* Objects are "abstract" and _cannot_ be used directly in your document. They
  can, however, be passed to a function that takes an object. Most of the
  functions, except constructors and formatters, return abstract objects and
  take them as input.
* Objects are essentially property lists. They have properties like
  `field=value`. They can be contsructed from other objects, e.g. have a
  property `friend=\Fred`. Except for _primitive_ objects (integers, strings,
  etc.), the property values should be abstract objects and _not_ their string
  representation.
* To actually "see" an object, format it with `\brtObjFmt`. See also
  `\brtObjShow`.
* At this time, the canonical way to _retreive_ an object is by "name". See
  `\brtObjNamed`.

### `\brtObjNamed`

```latex
\brtObjNamed {MyNamedObject}
```

Return the object named `MyNamedObject`.

All objects have one or more string names. When an object is created, it is
given an `@id`, which probably isn't very useful to the user. The user may
assign more names via `\brtObjName`.

### `\brtObjName`

```latex
\brtObjName {MyNamedObject} {\CrazyObjectBob}
```

Assign a name to an object.

It is an error to assign a name that has already been assigned.

### `\brtObjCons`

```latex
\brtObjCons {@name = Name, @type = \brtObjNamed {MyType}, ...}
```

Construct a new object from a comma-separated key-value list and return it.

Spaces around commas and equal signs are ignored. Keys must be strings. Reserved
keys start with `@`, so your custom keys should not start with `@`. Values can
be arbitrary token lists, but will most often be be other objects (retrieved by
name).

The object is automatically given an `@id=` property (which overrides any `@id=`
property passed to the function).

If `@name=` is provided, then the object is given that name. You can give it
more names later via `\brtObjName`.

if `@type=` is not provided, then the object is given the `Type` type.

Since this function returns an abstract object, you probably don't want to call
this function without passing the result to another function, such as to
`\brtObjFmtSet`. If you just want to call the function without passing the
result somewhere, wrap it in `\brtVoid` so that the dangling result doesn't
cause an error. E.g. `\brtVoid {\brtObjCons {...}}`.

### `\brtObjElim`

```latex
\brtObjElim {key} \MyObject
```

Retrieve the value associated with `key` in `\MyObject`.

### ...

TODO document the rest

## easymac

TODO

A system for wrapping macros around formatted objects so you don't have to type
`\brtObjFmt {\brtObjNamed {...}}` repeatedly in-document.

---

[functional]: https://ctan.org/pkg/functional
[tectonic]: https://github.com/tectonic-typesetting/tectonic/
[expl3]: https://www.ctan.org/pkg/expl3
