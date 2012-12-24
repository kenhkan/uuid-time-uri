utUri = require("../src/lib/UriMaker")

exports["construct a URI-friendly snippet"] = (test) ->
  epoch = new Date(2013, 1, 1)
  date = new Date(2014, 1, 1)
  month = 60 * 60 * 24 * 30 * 1000

  utUri.configure
    definition: 8
    epoch: epoch.getTime()
    domain: "example.com"
    granularity: month

  output = utUri.make("550e8400-e29b-41d4-a716-446655440000", date.getTime())

  test.equal(output, "example.com/19DdWCC")
  test.done()
