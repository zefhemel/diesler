define: methods {
  passLiteral: %lit {
    print: lit
  }
  
  ++ %lit {
    print: lit class
  }
}

passLiteral: "Hello"
passLiteral: 8 + 8
passLiteral: (self fire)

self ++ 20
