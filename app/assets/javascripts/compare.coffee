width = 1920
height = 1080

dragging = false

window.Compare =
  initialize: =>
    $('.divider').mousedown ->
      dragging = true

    $(document).mouseup ->
      dragging = false

    $(document).mousemove (e) ->
      unless dragging then return

      drop = e.pageX - $('.left').offset().left
      if drop < 0 then drop = 0
      if drop > width then drop = width

      $('.left').css('width', drop)
      $('.right').css('width', width - drop - 2)
