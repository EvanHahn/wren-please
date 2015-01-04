class Please {

  static fail(message) {
    Fiber.abort("Assertion error: " + message)
  }

  static beTruthy(a) {
    if (a) {} else {
      fail(a.toString + " isn't truthy")
    }
  }

  static beFalsy(a) {
    if (a) {
      fail(a.toString + " isn't falsy")
    }
  }

  static equal(a, b) {
    if (a != b) {
      fail(a.toString + " doesn't equal " + b.toString)
    }
  }

  static notEqual(a, b) {
    if (a == b) {
      fail(a.toString + " equals " + b.toString)
    }
  }

}

Please.beFalsy(false)
Please.beFalsy(null)
Please.beFalsy(true)
