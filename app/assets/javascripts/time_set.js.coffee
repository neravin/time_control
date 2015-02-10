ready = ->
	timers 		= []
	stopwatch = new StopWatch ".timer"

	$('body').on 'click', '.active', ->
		blockСlass 		= $(this).attr("class")
		timeSetForm 	= $(this).closest("#new_time_set")
		timerBlock 		= timeSetForm.find(".timer")
		controlPanel 	= $(this).closest(".control-timer")
		
		controlPanel.children(".button").addClass("active")
		$(this).removeClass("active")
		
		if blockСlass.indexOf('start') + 1
			stopwatch.start()
		if blockСlass.indexOf('pause') + 1
			stopwatch.pause()
		if blockСlass.indexOf('reset') + 1
			stopwatch.reset()

	$("#new_time_set").on("ajax:before", ->
		# set duration field
		$(this).find("#time_set_duration").val(stopwatch.duration())
	)
	$("#new_time_set").on("ajax:success", (e, data, status, xhr) ->
		window.console.log data
		window.console.log "ajax norm"
	).on "ajax:error", (e, xhr, status, error) ->
		window.console.log "ajax error"

$(document).ready(ready)
$(document).on('page:load', ready)
