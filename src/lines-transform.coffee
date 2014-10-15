Transform = require './transform'
Point = require './point'

module.exports =
class LinesTransform extends Transform
  getSubregion: (sourceStart) ->
    if nextNewlineStart = @source.positionOf('\n', sourceStart)
      region = @source.slice(sourceStart, nextNewlineStart.add(0, 1))
      region.setTargetSpan(Point(1, 0))
      region
    else
      @source.slice(sourceStart)
