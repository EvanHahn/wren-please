class Please {

  static equal(a, b) {
    if (a != b) {
      error_(a.toString + " doesn't equal " + b.toString)
    }
  }

  static error_(message) {
    Fiber.abort("Assertion error: " + message)
  }

}

Please.equal(1, 1)
Please.equal(1, 2)
