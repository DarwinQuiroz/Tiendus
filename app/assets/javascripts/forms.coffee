$(document).on "ajax:beforeSend", "#emails-form", ()->
    $("#email-info").html "Se está procesando tu petición.!"

$(document).on "ajax:success", "#emails-form", (e, data, estado, hxr)->
    $(this).slideUp()
    $("#email-info").html "Ahora eres parte de nuestros invitados.!"

$(document).on "ajax:error", "#emails-form", (e, data, estado, hxr)->
    console.log data
    $("#email-info").html data.responseJSON.email[0]