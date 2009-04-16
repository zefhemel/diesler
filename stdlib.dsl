local Logger

Logger = Object subClass: "Logger" with: methods{
  init {
    @level = 1
  }

  level: level {
    @level = level
  }

  debug: msg {
    if: [ @level == 1 ] then: {
      print: "[DEBUG] " + msg
    }
  }

  info: msg {
    if: [ @level >= 2 ] then: {
      print: "[INFO] " + msg
    }
  }
}

Object defineInstance: methods{
  not: e {
    if: [ e == true ] then: {
      return: false
    } else: {
      return: true
    }
  }

  match: e against: cs {
    cs invoke: (e,)
  }
}

Bool defineInstance: methods{
  && other {
    if: [ self == true ] then: {
      if: [ other == true ] then: {
        return: true
      } else: {
        return: false
      }
    } else: {
      return: false
    }
  }

  || other {
    if: [ self == true ] then: {
      if: [ other == true ] then: {
        return: true
      } else: {
        return: true
      }
    } else: {
      if: [ other == true ] then: {
        return: true
      } else: {
        return: false
      }
    }
  }
}

Int defineInstance: methods{
  <= other {
    return: self < other || self == other
  }

  >= other {
    return: self > other || self == other
  }
}

local Set

Set = Object subClass: "Set" with: methods{
  init {
    @list = ()
  }

  add: e {
    if: [ not: (@list contains: e) ] then: {
      @list add: e
    } 
    return: @list
  }

  describe {
    @list
  }
}

List defineInstance: methods{
  reverse {
    local l = ()
    local c = (self length) - 1
    while: [ c >= 0 ] do: {
      l add: (get: c)
      c = c - 1
    }
    return: l
  }

  reverseEach: m {
    self reverse each: m
  }

  addAll: l {
    l each: |e| { add: e }
    return: self
  }
}

List define: methods{
  rangeFrom: from to: to {
    local c = from
    local l = ()
    while: [ c <= to ] do: {
      l add: c
      c = c + 1
    }
    return: l
  }
}
