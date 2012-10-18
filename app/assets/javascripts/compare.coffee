width = 1920
height = 1080

dragging = false

window.Compare =
  initialize: ->
    $('.comparison').mousedown (e) =>
      # Don't start dragging if the swap button was pressed
      return  if $(e.target).hasClass('swap-button')

      e.preventDefault()
      dragging = true
      @updatePosition(e.pageX)

    $(document).mouseup (e) ->
      e.preventDefault()
      dragging = false

    $('.comparison').mousemove (e) ->
      e.preventDefault()

    $(document).mousemove (e) =>
      @updatePosition(e.pageX)  if dragging

    $('.comparison .swap-button').click(@swapSides)

  swapSides: =>
    leftImage = $('.left div').detach()
    rightImage = $('.right div').detach()
    $('.left').append(rightImage)
    $('.right').append(leftImage)

  updatePosition: (position) ->
    position -= $('.left').offset().left
    if position < 0 then position = 0
    if position > width then position = width

    $('.left').css('width', position)
    $('.right').css('width', width - position - 2)
