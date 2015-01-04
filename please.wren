class Please {

  static fail(message) {
    Fiber.abort("Assertion error: " + message)
  }

  static beTruthy(a) {
    if (a) {} else {
      fail(a.toString + " isn't truthy")
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

Please.beTruthy(true)
Please.beTruthy(0)
Please.beTruthy("hello")
Please.beTruthy(null)
