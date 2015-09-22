class Please {
  static errorMessage(message) {
    Fiber.abort("Assertion error: " + message)
  }

  static beTruthy(a) {
    if (a) {} else {
      errorMessage(a.toString + " isn't truthy")
    }
  }

  static beFalsy(a) {
    if (a) {
      errorMessage(a.toString + " isn't falsy")
    }
  }

  static exist(a) {
    if (a == null) {
      errorMessage(a.toString + " is null")
    }
  }

  static beNull(a) {
    if (a != null) {
      errorMessage(a.toString + " isn't null")
    }
  }

  static beTrue(a) {
    if (a != true) {
      errorMessage(a.toString + " isn't true")
    }
  }

  static beFalse(a) {
    if (a != false) {
      errorMessage(a.toString + " isn't false")
    }
  }

  static equal(a, b) {
    if (a != b) {
      errorMessage(a.toString + " doesn't equal " + b.toString)
    }
  }

  static deepEqual(a, b) {
    if (!isDeeplyEqual(a, b)) {
      errorMessage(a.toString + " doesn't deeply equal " + b.toString)
    }
  }

  static isDeeplyEqual(a, b) {
    if (a == b) {
      return true
    }

    if (a.type != b.type) {
      return false
    }

    var type = a.type
    if (type == List) {
      if (a.count != b.count) {
        return false
      }

      var iterA = null
      var iterB = null
      while (iterA = a.iterate(iterA)) {
        iterB = b.iterate(iterB)
        var aValue = a.iteratorValue(iterA)
        var bValue = b.iteratorValue(iterB)
        var isEqual = isDeeplyEqual(aValue, bValue)
        if (!isEqual) {
          return false
        }
      }

      return true
    } else if (type == Map) {
      if (a.count != b.count) {
        return false
      }

      for (key in a.keys) {
        if (!b.containsKey(key)) {
          return false
        }

        var isEqual = isDeeplyEqual(a[key], b[key])
        if (!isEqual) {
          return false
        }
      }

      return true
    } else {
      return false
    }
  }

  static notEqual(a, b) {
    if (a == b) {
      errorMessage(a.toString + " equals " + b.toString)
    }
  }

  static fail(a) {
    var fiber = Fiber.new(a)
    fiber.try()
    if (fiber.error == null) {
      errorMessage(a.toString + " doesn't fail")
    }
  }

  static succeed(a) {
    var fiber = Fiber.new(a)
    fiber.try()
    if (fiber.error != null) {
      errorMessage(a.toString + " aborts with error " + fiber.error)
    }
  }
}
