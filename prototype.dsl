redirect_to: editPage with_id: 7


local twitter = Namespace new
twitter data whatever = 8

User = Entity subclass: "User" as: {
  property:      name     :: String
  property:      age      :: Int
  list_property: messages -> Update <- author
}

Update = Entity subclass: "Update" as: {
  property:      author   -> User
  property:      message  :: String
  list_property: comments -> Comment
}

User all where: self name == "Zef" order_desc_by: self age

// Or even, using advanced AST transformation magic
entity: Update is: {
  author   -> User
  message  :: String
  comments -> Comment set
}

Update create: {
  author = User find_where: self name == "Zef"
  message = "Hello!"
  comments = ()
}

html: {
  p: {
    a href: "http://www.zefhemel.com" body: {
      "My website!"
    }
  }
}
