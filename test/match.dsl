local (a(isA: String), b(isA: Int), c(isA: Int)) = ("Zef", 25, 27)
print: (c, b, a)

local n (isA: Int) = 10
print: n

local User

User = Object subClass: "User" with: methods{
  init {
    @name = "unknown"
    @age = 0
  }

  name: name { @name = name }
  name { @name }

  age: age { @age = age }
  age { @age }
}

local zef = User new
zef name: "Zef Hemel"
zef age: 25

define: methods{
  showSecond: (first(isA: Int), second(isA: Int)) {
    print: second
  }

  saySomethingAbout: sth {
    match: sth against: cases{
      str(isA: String) { 
        print: "It's a string!" 
      }

      10 {
        print: "It's 10!"
      }

      n(isA: Int) {
        print: "It's an integer!"
      }

      u@User[ name => "Zef Hemel" ] {
        print: "Hey Zef!"
        print: u
      }

      User[ name => name, age => age ] {
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
zef name: "Pietje"
saySomethingAbout: zef

showSecond: (1, 2)
