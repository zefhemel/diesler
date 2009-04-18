local Term = Object subClass: "Term" with: methods{
  cons= cons {
    @cons = cons
  }

  cons {
    return @cons
  }

  children= children {
    @children = children
  }

  children {
    return @children
  }
}

Term define: methods{
  new: cons withChildren: children {
    local inst = self new
    inst setCons: cons
    inst setChildren: children
    return inst
  }
}

local Rule = Object subClass: "Rule" with: methods{
  init {
    @defs = ()
  }

  :+ m {
    @defs add: m
  }

  applyTo: o {
    local counter = 0
    local result = null
    @defs each: |d| {
      local r = d invoke: (o,)
      if: [ r != null ] then: {
        result = r
      }
    }
    return result
  }
}

local Strategy = Object subClass: "Strategy" with: methods{
  applyTo: o {
    raise: "Application not implemented"
  }
}

local TryStrategy = Strategy subClass: "TryStrategy" with: methods {
  apply: s to: t {
    local r = s applyTo: t
    if: [ r != null ] then: {
      return r
    } else: {
      return t
    }
  }
}

local testR = Rule new

testR :+ cases{
  8 { "Eight" }
}
testR :+ cases{
  10 { "Ten" }
}

local try = TryStrategy new

print: (try apply: testR to: 11)
