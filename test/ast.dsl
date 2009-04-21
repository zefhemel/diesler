
local ASTPrintCool

ASTPrintCool = ASTNode subclass: "ASTPrintCool" with: methods {
  eval {
    print: "That's cool!"
  }
}

local l = ASTPrintCool new
print: l class
l eval
