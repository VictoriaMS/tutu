$(document).on('turbolinks:load', function(){
    $('a.edit_route').click(function(e) {
      e.preventDefault()
      let routeId = $(this).data('routeId')
      let form = $('#edit_route_' + routeId)
      let title = $('#route_title_' + routeId)

      if ($(this).hasClass('Cancel')){
        $(this).html('Edit')
      } else {
        $(this).html('Cancel')
      }

      $(this).toggleClass('Cancel')
      form.toggle()
      title.toggle()
    })
})
