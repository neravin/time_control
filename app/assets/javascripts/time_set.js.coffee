timers = []

ready = ->
	stopwatch = new StopWatch ".timer"

	#$("button.active").click ->
	$('body').on 'click', 'button.active', ->
		blockСlass 		= $(this).attr("class")
		timeSetForm 	= $(this).closest("#new_time_set")
		timerBlock 		= timeSetForm.find(".timer")
		controlPanel 	= $(this).closest(".control-panel")
		
		controlPanel.children("button").addClass("active")
		$(this).removeClass("active")
		
		if blockСlass.indexOf('start') + 1
			stopwatch.start()
		if blockСlass.indexOf('pause') + 1
			stopwatch.pause()
		if blockСlass.indexOf('reset') + 1
			stopwatch.reset()

$(document).ready(ready)
$(document).on('page:load', ready)
