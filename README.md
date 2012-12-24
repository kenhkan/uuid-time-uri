Short URI Maker
====================

Given a UUID string and a UNIX timestamp in milliseconds, make a short URI
slug that can be tagged onto a domain. Each character of the slug is a
letter (lower and upper), a digit, a hyphen, a period, an underscore, or
a tilde, to be completely ANSI-URI-compliant. The slug contains two
concatenated components--a unique ID slug and a time-since slug.

Install
====================

```
npm install uuid-time-uri
```

Configuration
====================

The maker is configured using:

`utUri.configure({ ... options ... });`

And the options are as follows:

# {Number} [definition = 8] A number between 1 and 32

A number of characters is taken from the UUID as digest for the slug,
excluding dashes.  A UUID is 32 characters long and thus valid value is
1 - 32. Default is 8.

# {String} [domain]

An optional domain can be provided to be inserted before the slug.

# {Number} [epoch = 1357016400000] A positive number

An epoch can be defined as the number of milliseconds since the UNIX Epoch
(i.e. 1970-01-01) on which the counting for the URI starts. Defaulf to
2013-01-01.

# {Number} [granularity = 86400] A positive number

A granularity, defined as a number of milliseconds, is provided to serve as a
unit of counts. For instance, if the granularity is a second,
represented as `1`, the time-since slug represents the number of
milliseconds since the defined epoch. Default to a day.

Usage
====================

Simply call `make()` with the following arguments:

# {String} uuid The UUID (with or without dashes)
# {Number} time UNIX timestamp

Examples
====================

```
var utUri = require('uuid-time-uri');
var utUri epoch = new Date(2013, 01, 01);
var date = new Date(2014, 01, 01);
var month = 60 * 60 * 24 * 30;
var output = null;

utUri.configure({
  definition: 8
  epoch: epoch.getTime(),
  domain: 'example.com',
  granularity: month
});

output = utUri.make('550e8400-e29b-41d4-a716-446655440000', date.getTime());

console.log(output); // Equals 'example.com/BVcC91B'
```
