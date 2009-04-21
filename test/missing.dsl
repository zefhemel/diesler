
local User = Object subClass: "User" with: methods{
  missingMethod: nm withArgs: args {
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
