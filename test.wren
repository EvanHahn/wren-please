// Please.fail and Please.succeed need to be tested "raw",
// but once we have those two, we can test the rest. The
// following are tests of fail and succeed:

var shouldError = new Fn {|block|
  var fiber = new Fiber(block)
  fiber.try
  if (fiber.error) {} else {
    Fiber.abort("Block should've thrown an error")
  }
}

Please.succeed { }
Please.succeed { null }
Please.succeed { "wow" }
Please.succeed { 0 }
Please.succeed { [] }
Please.succeed {
  return false
}
Please.succeed(new Fn { 123 })

shouldError.call { Please.succeed { 123.badMethod } }
shouldError.call { Please.succeed { Fiber.abort("crap") } }

Please.fail { 123.badMethod }
Please.fail { Fiber.abort("ugh") }

shouldError.call { Please.fail { } }
shouldError.call { Please.fail { null } }
shouldError.call { Please.fail { "wow" } }
shouldError.call { Please.fail { 0 } }
shouldError.call { Please.fail { [] } }
shouldError.call { Please.fail {
  return false
} }
shouldError.call { Please.fail(new Fn { 123 }) }

// Now we can test the rest.

Please.succeed {
  Please.beTruthy(true)
  Please.beTruthy(0)
  Please.beTruthy("")
  Please.beTruthy([])
}
Please.fail { Please.beTruthy(false) }
Please.fail { Please.beTruthy(null) }

Please.succeed {
  Please.beFalsy(false)
  Please.beFalsy(null)
}
Please.fail { Please.beFalsy(true) }
Please.fail { Please.beFalsy(0) }
Please.fail { Please.beFalsy("") }
Please.fail { Please.beFalsy([]) }

Please.succeed {
  Please.exist(true)
  Please.exist(0)
  Please.exist(false)
  Please.exist([])
  Please.exist("")
}
Please.fail { Please.exist(null) }
