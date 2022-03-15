$(document).on('turbolinks:load', function() {
    $('a.edit_station').click(function(e) {
        e.preventDefault()
        let stationId = $(this).data('stationId')
        let form = $('#edit_railway_station_' + stationId)
        let title = $('#railway_station_title_' + stationId)
        
        if ($(this).hasClass('Cancel')) {
            $(this).html('Edit')
        } else {
            $(this).html('Cancel')
        }

        $(this).toggleClass('Cancel')
        title.toggle()
        form.toggle()
    });
  });
