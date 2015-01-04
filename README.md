Please
======

Please is a simple assertion library for Wren.

Basic usage:

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
