import: "lib/html.dsl"

local HomePage = WebSimple create_page: methods {
  title { "My new page" }
  body {
    h1: { text: "Welcome!" }
    hr: {}
    ol: {
      10 times: {
        li: {
          a_href: "http://twitter.com/zef" body: {
            text: "Twitter page"
          }
        }
      }
    }
    hr: {}
    text: "(C) Zef Hemel"
  }
}

print: HomePage new render
