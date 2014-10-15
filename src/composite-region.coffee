Point = require './point'

module.exports =
class CompositeRegion
  constructor: (@children, @sourceSpan, @targetSpan) ->

  getSourceSpan: ->
    @sourceSpan ? @computeSourceSpan()

  getTargetSpan: ->
    @targetSpan ? @computeTargetSpan()

  computeSourceSpan: ->
    span = Point(0, 0)
    span = span.add(child.getSourceSpan()) for child in @children
    span

  computeTargetSpan: ->
    span = Point(0, 0)
    for child in @children
      span = span.add(child.getTargetSpan())
    span

  summarize: ->
    sourceSpan: @getSourceSpan().summarize()
    targetSpan: @getTargetSpan().summarize()
    children: @children.map (c) -> c.summarize()
