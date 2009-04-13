@counter = 0
defineMethods: {
  takX: x y: y z: z {
    @counter = @counter + 1
    if: [ y >= x ] then: {
       return: z
    } else: {
       return: (takX: (takX: x-1 y: y z:z) y: (takX: y-1 y: z z: x) z: (takX: z-1 y: x z: y))
    }
  }
}

print: (takX: 24 y: 16 z: 8)
print: "Number of calls:"
print: @counter
