define: methods {
  pass_literal: %lit {
    print: lit
  }
  
  ++ %lit {
    print: lit class
  }
}

pass_literal: "Hello"
pass_literal: 8 + 8
pass_literal: (self fire)

self ++ 20
