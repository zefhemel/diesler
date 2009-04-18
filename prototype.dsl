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
