Point = require './point'

module.exports =
class TextRegion
  constructor: (@text, @sourceSpan, @targetSpan) ->
    @sourceSpan ?= Point(0, @text.length)
    @targetSpan ?= Point(0, @text.length)

  getSourceSpan: -> @sourceSpan

  setSourceSpan: (@sourceSpan) -> @sourceSpan

  getTargetSpan: -> @targetSpan

  setTargetSpan: (@targetSpan) -> @targetSpan

  positionOf: (string, startPosition) ->
    index = @text.indexOf(string, startPosition.columns)
    Point(0, index) unless index is -1

  slice: (start, end) ->
    new TextRegion(@text.slice(start.columns, end?.columns))

  summarize: ->
    sourceSpan: @sourceSpan.summarize()
    targetSpan: @targetSpan.summarize()
    text: @text
