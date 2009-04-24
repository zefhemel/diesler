import: "lib/html.dsl"

local Parts = Object subclass

Parts define: methods{
  header {
    Web generate_html: {
      h1: { text: "WebDiesler" }
      hr: {}
    }
  }

  footer {
    Web generate_html: {
      hr: {}
      text: "(C) Zef Hemel"
    }
  }
}

local output = Web generate_html: {
  html: {
    head: {
      title: { text: "Welcome to WebDiesler!" }
    }
    body: {
      template: Parts header
      h2: {
        text: "Hello there!"
      }
      p: {
        a_href: "http://twitter.com/zef" body: {
          text: "Twitter page"
        }
      }
      template: Parts footer
    }
  }
}

print: output
