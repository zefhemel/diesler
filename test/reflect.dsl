local mymethod = |n| {
  print: n
  print: n * n
}

mymethod selector = "mymethod"
mymethod invoke: (7,)
local block = mymethod block
local statements = block statements
print: (statements get: 0) object
statements remove_at: 0

print: "Now invoking modified method"
mymethod invoke: (7,)
