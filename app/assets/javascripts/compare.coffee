width = 1920
height = 1080

dragging = false

window.Compare =
  initialize: ->
    $('.comparison').mousedown (e) =>
      e.preventDefault()
      dragging = true
      @updatePosition(e.pageX)

    $(document).mouseup (e) ->
      e.preventDefault()
      dragging = false

    $('.comparison').mousemove (e) ->
      e.preventDefault()

    $(document).mousemove (e) =>
      @updatePosition(e.pageX) if dragging

  updatePosition: (position) ->
    position -= $('.left').offset().left
    if position < 0 then position = 0
    if position > width then position = width

    $('.left').css('width', position)
    $('.right').css('width', width - position - 2)
