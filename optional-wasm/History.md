0.10.0 / 2019-01-14
==================

  * Changed: make initial Optional!T state all zeros
  * Fixed: assert when front called on empty optional

0.9.0 / 2018-12-18
==================

  * Changed: make orElse value lazy
  * Added: predicate version of orElse

v0.8.0 / 2018-12-11
==================

  * Added: betterC support PR #28 from @skoppe

v0.7.4 / 2018-11-15
===================

  * Fixed: empty state when assigning another optional

v0.7.3 / 2018-10-29
===================

  * Changed: pass range as auto ref to opEquals

v0.7.2 / 2018-10-29
===================

  * Added: Allow optional to be compared with other ranges

v0.7.0 / 2018-09-21
==================

  * Changed: dispatch does not mutate value types
  * Changed: dispatching is automatically flattened
  * Added: support for array indexing and slicing
  * Added: support for opOpAssign
  * Added: safe pure nogc dispatch
  * Added: dispatching on non optional nullable types
  * Added: covariant assignment to optional

v0.6.0 / 2018-08-24
===================

  * Changed: Allow qualified optionals be used on free functions
  * Fixed: Don't call destroy on reference types when setting to none

v0.5.0 / 2018-08-16
===================

  * Changed: Make dispatch return optional
  * Changed: Undo double optional chaining
  * Added: a contruct function for objects that can't copy
  * Added: opCall
  * Fixed: Return auto ref
  * Fixed: Use template this to maintain qualified this
  * Fixed: copmile for @disabled copy and nested struct init

