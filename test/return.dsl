
define: methods{
  returnSomething {
    print: "Hello"
    if: [ true ] then: {
      return 10
    }
    print: "there"
    return 2
    print: "World"
  }

  whatever {
    while: [true] do: {
      return false
    }
  }
}

self returnSomething
self whatever

local m = cases {
  _ {
    return 10
    print: "Hello there!"
  }
}

print: (m invoke: (7,))

