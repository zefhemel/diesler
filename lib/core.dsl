
Object define: methods {
  subClass: name with: ms {
    local cls = subClass: name
    cls defineInstance: ms
    return cls
  }

  subClass {
    return subClass: "Unnamed"
  }
}

Object defineInstance: methods{
  not: e {
    e != true
  }

  match: e against: cs {
    cs invoke: (e,)
  }
}


Bool defineInstance: methods{
  && other {
    if: [ self == true ] then: {
      if: [ other == true ] then: {
        return true
      }
    }
    return false
  }

  || other {
    if: [ self == true ] then: {
      if: [ other == true ] then: {
        return true
      } else: {
        return true
      }
    } else: {
      if: [ other == true ] then: {
        return true
      } else: {
        return false
      }
    }
  }
}

Int defineInstance: methods{
  <= other {
    return self < other || self == other
  }

  >= other {
    return self > other || self == other
  }
}
