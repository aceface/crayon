util = require 'util'

module.exports = require './crayon'

# Layer for compatibility with https://github.com/jharding/crayon
module.exports.logger = require 'console'
verbose = true # This is a change in the default though

Object.defineProperty module.exports, 'verbose',
  enumerable: true
  configurable: true
  get: -> verbose
  set: (val) ->
    verbose = !!val

for level in ['log', 'info', 'warn']
  module.exports[level] = (args...) ->
    if module.exports.verbose
      module.exports.logger[level] util.format args...

module.exports.success = (args...) ->
  module.exports.logger.log module.exports.green util.format args...

module.exports.error = (args...) ->
  module.exports.logger.error module.exports.red util.format args...
