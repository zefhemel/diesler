
Int defineInstance: methods{
  .. up {
    local l = ()
    local counter = self
    while: [ counter <= up ] do: {
      l add: counter
      counter = counter + 1
    }
    return l
  }

  ** exp {
    if: [ exp == 0 ] then: {
      return 1
    }
    local n = self
    local counter = 0
    while: [ counter < exp-1 ] do: {
      n = n * self
      counter = counter + 1
    }
    return n
  }

  fac {
    if: [ self == 0 ] then: {
      return 1
    } else: {
      return self * (self-1) fac
    }
  }

  times: m {
    local counter = 0
    while: [ counter < self ] do: {
      m invoke
      counter = counter + 1
    }
  }

  isEven {
    self % 2 == 0
  }

  isOdd {
    self % 2 == 1
  }
}
