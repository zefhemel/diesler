try: {
  raise: 10
} catch: |e| {
  match: e against: cases{
    n(isA: Int) {
      print: n
    }

    _ {
      print: "Something else"
    }
  }
}
