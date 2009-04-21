local Namespace

Namespace = Object subclass: "Namespace" with: methods{
  init {
    @map = Dict new
  }

  missingMethod: ns withArgs: args {
    if: (ns char_at: (ns length)-1) == "=" then: {
      @map at: (ns substring_from: 0 to: (ns length)-1) put: (args get: 0)
    } else: {
      @map get: ns
    }
  }

  list {
    @map
  }
}

local ns = Namespace new

ns zef = 8
print: ns zef
