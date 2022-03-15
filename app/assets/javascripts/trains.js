$(document).on('turbolinks:load', function(){
    $('a.edit_train').click(function(e) {
        e.preventDefault()
        let trainId = $(this).data('trainId')
        let form = $('#edit_train_' + trainId)
        let title = $('#train_title_' + trainId)

        if ($(this).hasClass('Cancel')) {
          $(this).html('Edit')
        } else {
          $(this).html('Cancel')
        }

        $(this).toggleClass('Cancel')
        form.toggle()
        title.toggle()
    });
});
