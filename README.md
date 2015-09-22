Please
======

Please is a simple assertion library for [Wren](https://munificent.github.io/wren/). It works with Wren 0.0.0 as of now.

Basic usage
-----------

```dart
import "please" for Please

Please.equal(123, 123)
Please.notEqual(456, 789)

Please.deepEqual([1, [2, 3]], [1, [2, 3]])

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
wren test.wren
```
