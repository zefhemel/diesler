@counter = 0

define: methods{
  tak: (x, y, z) {
    @counter = @counter + 1
    if: y >= x then: {
       return z
    } else: {
       return self tak: (self tak: (x-1, y, z), self tak: (y-1, z, x), self tak: (z-1, x, y))
    }
  }
}

print: (tak: (24, 16, 8)) 
print: "Number of calls:"
print: @counter
