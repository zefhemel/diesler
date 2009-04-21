try: {
  raise: 10
} catch: |e| {
  match: e against: cases{
    n(isa: Int) {
      print: n
    }

    _ {
      print: "Something else"
    }
  }
}
