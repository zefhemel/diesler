import: "stdlib.dsl"

@counter = 0

/*
define: methods{
  takX: x y: y z: z {
    @counter = @counter + 1
    if: [ y >= x ] then: {
       return z
    } else: {
       return (takX: (takX: x-1 y: y z:z) y: (takX: y-1 y: z z: x) z: (takX: z-1 y: x z: y))
    }
  }
}

print: (takX: 24 y: 16 z: 8)
print: "Number of calls:"
print: @counter
*/

define: methods{
  tak: (x, y, z) {
    @counter = @counter + 1
    if: [ y >= x ] then: {
       return z
    } else: {
       return self tak: (self tak: (x-1, y, z), self tak: (y-1, z, x), self tak: (z-1, x, y))
    }
  }
}

print: (tak: (24, 16, 8)) 
print: "Number of calls:"
print: @counter
