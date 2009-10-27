String define_instance: methods{
  split: separatorChar {
    local l = ()
    local ms = MutableString new
    local counter = 0
    while: counter < self length do: {
      if: (self char_at: counter) == separatorChar then: {
        l add: ms as_string
        ms = MutableString new
      } else: {
        ms append: (self char_at: counter)
      }
      counter = counter + 1
    }
    if: ms length > 0 then: {
      l add: ms as_string
    }
    return l
  }

  contains: char {
    local found = false
    (0..self length) each: |n| {
      if: (self char_at: n) == char then: {
        found = true
      }
    }
    return found
  }
}
