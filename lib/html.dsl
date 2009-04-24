local Page = Object subclass: "Page" with: methods{
  init {
    @stream = MutableString new
  }

  missing_method: sel with_args: args {
    local selector_parts = sel split: ":"
    local tag = selector_parts get: 0
    local attributes = ()
    local body_attr = null
    (0..selector_parts length) each: |i| {
      local attribute = (selector_parts get: i)
      if: ((selector_parts get: i) contains: "_") then: {
        (tag, attribute) = (selector_parts get: i) split: "_"
      }
      if: (not: ((args get: i) isa: Method)) then: {
        attributes add: attribute + "=" + (self value_to_html: (args get: i))
      }
      if: ((args get: i) isa: Method) then: {
        body_attr = args get: i
      }
    }
    if: body_attr != null then: {
      @stream append: "<" + tag + " " + (attributes join: " ") + ">"
      body_attr invoke: () on: self
      @stream append: "</" + tag + ">"
    } else: {
      @stream append: "<" + tag + " " + (attributes join: " ") + "/>"
    }
  }

  text: txt {
    @stream append: txt
  }

  template: html {
    @stream append: html
  }

  value_to_html: value {
    return "'" + value as_string + "'"
  }

  as_string {
    @stream as_string
  }
}

local WebSimple = Page subclass

WebSimple define_instance: methods{
  title { "" }
  render {
    html: {
      head: {
        title: { text: self title }
      }
      body: {
        self body
      }
    }
  }
}

WebSimple define: methods{
  create_page: meths {
    local sc = self subclass
    sc define_instance: meths
    return sc
  }
}
