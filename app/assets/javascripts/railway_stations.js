$(document).on('turbolinks:load', function() {
    $('a.edit_station').click(function(e) {
        e.preventDefault()
        let station_id = $(this).data('stationId')
        let form = $('#edit_railway_station_' + station_id)
        let title = $('#railway_station_title_' + station_id)
        
        if (!$(this).hasClass('Cancel')) {
            $(this).html('Cancel')
            $(this).addClass('Cansel')
        } else {
            $(this).html('Edit')
            $(this).removeClass('Cansel')
        }
        title.toggle()
        form.toggle()
    });
  });
