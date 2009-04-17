local Set

Set = Object subClass: "Set" with: methods{
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

List defineInstance: methods{
  reverse {
    local l = ()
    local c = (self length) - 1
    while: [ c >= 0 ] do: {
      l add: (get: c)
      c = c - 1
    }
    return l
  }

  reverseEach: m {
    self reverse each: m
  }

  addAll: l {
    l each: |e| { add: e }
    return self
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
    return l
  }
}

local TypedList = List subClass: "TypedList" with: methods {
  add: item {
    super add: item
  }
}
