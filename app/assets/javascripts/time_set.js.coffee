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
		window.console.log "time_set ajax success"
		clearTimerForm($(this), stopwatch)
	).on "ajax:error", (e, xhr, status, error) ->
		window.console.log "time_set ajax error"	

$(document).ready(ready)
$(document).on('page:load', ready)

# functions
clearTimerForm = (blockTimer, stopwatch) ->
	# clear field in timer's form
	blockTimer.find("#time_set_duration").val(0)
	blockTimer.find("#time_set_local_result").val("")
	clear_select(blockTimer.find(".category-select"))

	blockTimer.find(".control-timer").children(".button").removeClass("active")
	blockTimer.find(".start").addClass("active")
	stopwatch.reset()

clear_select = (element) ->
  if(element.hasClass("category-select"))
    element.children(".cs-placeholder").text("Категория")
    element.children("select.category-select ").val("")
  if(element.hasClass("services-select"))
    element.children(".cs-placeholder").text("Тип объявления")
    element.children("select.services-select ").val("")
  element.children(".cs-options").find("li[class='cs-selected']").removeClass("cs-selected")

