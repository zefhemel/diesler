Logger = Object subClass: "Logger" withMethods: {
  init {
    @level = 1
  }

  level: level {
    @level = level
  }

  debug: msg {
    if: [ @level == 1 ] then: {
      print: "[DEBUG] " + msg
    }
  }

  info: msg {
    if: [ @level >= 2 ] then: {
      print: "[INFO] " + msg
    }
  }
}
