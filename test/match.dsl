(a(isA: String), b(isA: Int), c(isA: Int)) = ("Zef", 25, 27)
print: (c, b, a)

n (isA: Int) = 10
print: n
defineMethods: {
  saySomethingAbout: sth {
    match: sth against: {
      str(isA: String): { 
        print: "It's a string!" 
      }

      10: {
        print: "It's 10!"
      }

      n(isA: Int): {
        print: "It's an integer!"
      }
    }
  }
}

saySomethingAbout: 10
saySomethingAbout: "Zef Hemel"
saySomethingAbout: c
