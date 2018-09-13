# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'submit', '#translate_form', (e) ->
    e.preventDefault()
    
    form = $('#translate_form')
    
    $.ajax
        method: 'post'
        url: '/translations'
        data: form.serializeArray()
        success: (response) ->
            $('#results span').text(response["output"])
            $("#results").show();
            