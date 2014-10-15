CompositeRegion = require './composite-region'
Point = require './point'

module.exports =
class Transform
  source: null

  constructor: (origin) ->
    @setOrigin(origin) if origin?

  setOrigin: (origin) ->
    if @source?
      @source.setOrigin(origin)
    else
      @source = origin

  getRegion: ->
    sourcePosition = Point(0, 0)
    subregions = []

    while subregion = @getSubregion(sourcePosition)
      nextSourcePosition = sourcePosition.add(subregion.getSourceSpan())
      break if nextSourcePosition.isEqual(sourcePosition)
      subregions.push(subregion)
      sourcePosition = nextSourcePosition

    new CompositeRegion(subregions)
