module.exports =
class Point
  constructor: (rows, columns) ->
    if this instanceof Point
      @rows = rows
      @columns = columns
    else
      return new Point(rows, columns)

  add: (rows, columns) ->
    if rows instanceof Point
      return @add(rows.rows, rows.columns)

    if Math.abs(rows) > 0
      new Point(@rows + rows, columns)
    else
      new Point(@rows, @columns + columns)

  isEqual: (other) ->
    @rows is other.rows and @columns is other.columns

  summarize: -> [@rows, @columns]
