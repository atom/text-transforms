Region = require './region'
Transform = require './transform'

module.exports =
class TransformStack
  constructor: ->
    @transforms = []

  addTransform: (name, params) ->
    transform = new Transform(name, params)
    transform.setSource(@transforms[@transforms.length - 1].getSource() ? @source)
    @transforms.push()

  setSourceRegion: (sourceText) ->
    @source = new Region(sourceText)

  getTargetRegion: ->
