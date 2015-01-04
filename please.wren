class Please {

  static fail(message) {
    Fiber.abort("Assertion error: " + message)
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

Please.notEqual(1, 2)
Please.notEqual(1, 1)
