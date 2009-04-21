
Object define: methods {
  subclass: name with: ms {
    local cls = subclass: name
    cls define_instance: ms
    return cls
  }

  subclass {
    return sub_class: "Unnamed"
  }
}

Object define_instance: methods{
  not: e {
    e != true
  }

  match: e against: cs {
    cs invoke: (e,)
  }

  responds_to: selector {
    (self all_methods map: |m| { m selector }) contains: selector
  }
}


Bool define_instance: methods{
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

Int define_instance: methods{
  <= other {
    return self < other || self == other
  }

  >= other {
    return self > other || self == other
  }
}
