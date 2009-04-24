
local User = Object subclass: "User" with: methods{
  missing_method: nm with_args: args {
    print: "Called " + nm
    print: "Args:"
    print: args
  }
}

local u = User new

u bla: "Hoi"
u whatever
u + 7

u name = "Zef"
