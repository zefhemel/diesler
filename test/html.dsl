import: "lib/html.dsl"

local HomePage

HomePage = WebSimple create_page: methods {
  title { "My new page" }
  body {
    h1: { text: "Welcome!" }
    hr: {}
    p: {
      a_href: "http://twitter.com/zef" body: {
        text: "Twitter page"
      }
    }
    hr: {}
    text: "(C) Zef Hemel"
  }
}

print: HomePage new render
