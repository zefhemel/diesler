local Set

Set = Object subclass: "Set" with: methods{
  init {
    @list = ()
  }

  add: e {
    if: [ not: (@list contains: e) ] then: {
      @list add: e
    } 
    return @list
  }

  describe {
    @list
  }
}

List define_instance: methods{
  reverse {
    local l = ()
    local c = (self length) - 1
    while: [ c >= 0 ] do: {
      l add: (get: c)
      c = c - 1
    }
    return l
  }

  each: m {
    local i = 0
    while: [ i < self length ] do: {
      m invoke: ((get: i),)
      i = i + 1
    }
  }

  map: m {
    local i = 0
    local resultList = ()
    while: [ i < self length ] do: {
      resultList add: (m invoke: ((get: i),))
      i = i + 1
    }
    return resultList
  }

  filter: m {
    local i = 0
    local resultList = ()
    while: [ i < self length ] do: {
      if: [m invoke: (self get: i,)] then: {
        resultList add: (self get: i)
      }
      i = i + 1
    }
    return resultList
  }

  reverse_each: m {
    self reverse each: m
  }

  add_all: l {
    l each: |e| { add: e }
    return self
  }
}

local TypedList = List subclass: "TypedList" with: methods {
  add: item {
    super add: item
  }
}
