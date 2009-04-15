try: {
  raise: 10
} catch: |e| {
  match: e against: {
    n(isA: Int): {
      print: n
    }

    _: {
      print: "Something else"
    }
  }
}
