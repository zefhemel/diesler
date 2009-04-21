local (a(isa: String), b(isa: Int), c(isa: Int)) = ("Zef", 25, 27)
print: (c, b, a)

local n (isa: Int) = 10
print: n

local User

User = Object subclass: "User" with: methods{
  init {
    @name = "unknown"
    @age = 0
  }

  name= name { @name = name }
  name { @name }

  age= age { @age = age }
  age { @age }
}

local zef = User new
zef name = "Zef Hemel"
zef age = 25

define: methods{
  show_second: (first(isa: Int), second(isa: Int)) {
    print: second
  }

  say_something_about: sth {
    match: sth against: cases{
      str(isa: String) { 
        print: "It's a string!" 
      }

      10 {
        print: "It's 10!"
      }

      n(isa: Int) {
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

say_something_about: 10
say_something_about: "Zef Hemel"
say_something_about: c
say_something_about: zef
zef name = "Pietje"
say_something_about: zef

show_second: (1, 2)
