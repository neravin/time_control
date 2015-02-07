ready = ->
	$("button.active").click ->
		blockСlass = $(this).attr("class")
		timeSetForm = $(this).closest("#new_time_set")
		if blockСlass.indexOf('start') + 1
			timerBlock = timeSetForm.find(".timer")
			timer(0, timerBlock, true)

$(document).ready(ready)
$(document).on('page:load', ready)