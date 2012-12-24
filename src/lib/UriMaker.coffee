encdec = require("encdec")
_ = require("underscore")

# The "definition", or how much of the original is retained, of the UUID
# provided. This can only be from 1 to 32.
#
# @private
# @type Number
# @default 8
definition = 8

# Prefix to the slug
#
# @private
# @type String
# @default ""
prefix = ""

# The epoch from which counting starts in milliseconds, default to 2013-01-01
#
# @private
# @type Number
# @default 1357016400000
epoch = 1357016400000

# The unit of a count up, measured in milliseconds
#
# @private
# @type Number
# @default 86400
unit = 86400000

# UUID to slug decoder
#
# @private
# @type encdec
decoder = encdec.create("0123456789ABCDEF")

# Slug encoder
#
# @private
# @type encdec
encoder = encdec.create("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-._~")


## Public functions ##

# Configure the maker. See README for more detail
#
# @param options A hash containing all options
exports.configure = (options) ->
  if _.isObject(options)
    for own key, value of options
      switch key
        when "definition"
          if _.isNumber(value)
            definition = _.max([1, _.min([32, value])])

        when "domain"
          if _.isString(value)
            prefix = "#{value}/"

        when "epoch"
          if _.isNumber(epoch)
            epoch = _.max([0, value])

        when "granularity"
          if _.isNumber(value)
            unit = _.max([0, value])

# Construct the URI
#
# @param {String} uuid The UUID (with or without dashes)
# @param {Number} time UNIX timestamp in milliseconds
exports.make = (uuid, time) ->
  return unless _.isString(uuid) and _.isNumber(time)

  # Preparation
  uuid = uuid.replace("-", "").substring(0, definition).toUpperCase()
  time = Math.floor((time - epoch) / unit)

  # Base conversion
  front = encoder.encode(decoder.decode(uuid))
  back = encoder.encode(time)

  "#{prefix}#{front}#{back}"
