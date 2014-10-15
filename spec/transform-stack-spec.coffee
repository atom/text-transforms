LinesTransform = require '../src/lines-transform'
TextRegion = require '../src/text-region'

describe "transforms", ->
  describe "lines transform", ->
    it "breaks the source region into individual lines", ->
      origin = new TextRegion("the quick brown fox\njumps over\nthe lazy dog.")
      transform = new LinesTransform(origin)
      expect(transform.getRegion().summarize()).toEqual {
        sourceSpan: [0, 44]
        targetSpan: [2, 13]
        children: [
          {
            sourceSpan: [0, 20]
            targetSpan: [1, 0]
            text: "the quick brown fox\n"
          }
          {
            sourceSpan: [0, 11]
            targetSpan: [1, 0]
            text: "jumps over\n"
          }
          {
            sourceSpan: [0, 13]
            targetSpan: [0, 13]
            text: "the lazy dog."
          }
        ]
      }
