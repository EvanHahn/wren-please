Please
======

Please is a simple assertion library for [Wren](https://munificent.github.io/wren/). It works with Wren 0.0.0 as of now.

Basic usage
-----------

Until some kind of [include/require/import](https://github.com/munificent/wren/issues/46) is added, you'll have to paste `please.wren` at the top of your file.  Then:

```dart
Please.equal(123, 123)
Please.notEqual(456, 789)

Please.succeed { "Hello" + "nation" }
Please.fail { 123.badMethod }

Please.beNull(null)
Please.exist(anythingOtherThanNull)

Please.beTruthy(true)
Please.beTruthy(123)
Please.beFalsy(false)
Please.beFalsy(null)
```

Hacking on this
---------------

To run tests, run this:

```sh
WREN_PATH=/path/to/wren test.sh
```
