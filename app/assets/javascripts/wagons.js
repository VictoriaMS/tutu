$(document).on('turbolinks:load', function(){
    $('#wagon_type').change(function(e){
        e.preventDefault()
        let type = $(this).val()
        let form = $('#' + type)

        $('.form').hide()
        form.show()
    })
})
