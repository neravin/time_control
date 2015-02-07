ready = ->
	$("#new_time_set").on("ajax:success", (e, data, status, xhr) ->
		$(".success-message").fadeIn()
	).on "ajax:error", (e, xhr, status, error) ->
		alert "Errors"


$(document).ready(ready)
$(document).on('page:load', ready)
