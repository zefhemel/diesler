(a(isA: String), b(isA: Int), c(isA: Int)) = ("Zef", 25, 27)
print: (c, b, a)

n (isA: Int) = 10
print: n

User = Object subClass: "User" withMethods: {
  init {
    set: "name" to: "unkown"
    set: "age" to: 0
  }

  name: name {
    set: "name" to: name
  }

  name {
    get: "name"
  }

  age: age {
    set: "age" to: age
  }

  age {
    get: "age"
  }
}

zef = User new
zef name: "Zef Hemel"
zef age: 25

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

      User[ name => name, age => age ]: {
        print: "It's a user called " + name + " who's "
        print: age
      }
    }
  }
}

saySomethingAbout: 10
saySomethingAbout: "Zef Hemel"
saySomethingAbout: c
saySomethingAbout: zef
