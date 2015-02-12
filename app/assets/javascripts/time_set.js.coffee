class TimeSet
	constructor: (@name, @timerText, @durationText) ->
		# name         - string
		# timerText    - hh:mm:ss
		# durationText - hh:mm:ss

ready = ->
	timers 		= []
	stopwatch = new StopWatch ".timer"

	select_category_ajax("#new_time_set")

	$('body').on 'click', '.active', ->
		blockСlass   = $(this).attr("class")
		timeSetForm  = $(this).closest("#new_time_set")
		timerBlock   = timeSetForm.find(".timer")
		controlPanel = $(this).closest(".control-timer")
		
		controlPanel.children(".button").addClass("active")
		$(this).removeClass("active")
		
		if blockСlass.indexOf('start') + 1
			stopwatch.start()
			window.console.log stopwatch.timeStart().toISOString()
			timeSetForm.find("#time_set_time_start").val(stopwatch.timeStart().toISOString())
		if blockСlass.indexOf('pause') + 1
			stopwatch.pause()
		if blockСlass.indexOf('reset') + 1
			stopwatch.reset()

	$("#new_time_set").on("ajax:before", ->
		# set duration field
		$(this).find("#time_set_duration").val(stopwatch.duration())
	)
	$("#new_time_set").on("ajax:success", (e, data, status, xhr) ->
		newTimeSetblock = $(this).closest("#new_time_set")
		affairName      = newTimeSetblock.find("#affair-select .cs-placeholder").text()
		timerText       = stopwatch.timeStart().toString().split(" ")[4] # hh:mm:ss
		durationText    = newTimeSetblock.find(".timer").text() # hh:mm:ss
		timeSetComplete = new TimeSet(affairName ,timerText, durationText)

		# add new row in time_sets_today table
		addTimeSetToTable("#time_sets_today", timeSetComplete)
		# clear timer form
		clearTimerForm($(this), stopwatch)
	).on "ajax:error", (e, xhr, status, error) ->
		#window.console.log "time_set ajax error"	

$(document).ready(ready)
$(document).on('page:load', ready)

# functions
addTimeSetToTable = (idTimeSets, timeSetNew) ->
	# idTimeSets - type string "#..."
	# timeSetNew - type TimeSet
	totalTimeClass = idTimeSets + ' ' + '.total-time-sets'
	row = "<div class = 'row'>
					<div class = 'cell'>#{timeSetNew.name}</div>
					<div class = 'cell'>#{timeSetNew.timerText}</div>
					<div class = 'cell'>#{timeSetNew.durationText}</div>
				</div>"
	$(row).insertBefore(totalTimeClass)

clearTimerForm = (blockTimer, stopwatch) ->
	# clear field in timer's form
	blockTimer.find("#time_set_duration").val(0)
	blockTimer.find("#time_set_local_result").val("")
	clear_select(blockTimer.find("#affair-select .cs-select"), 'chose a affair')

	blockTimer.find(".control-timer").children(".button").removeClass("active")
	blockTimer.find(".start").addClass("active")
	stopwatch.reset()

clear_select = (element, defaultText) ->
  element.children(".cs-placeholder").text(defaultText)
  element.children("select.cs-select").val("")
  element.children(".cs-options").find("li[class='cs-selected']").removeClass("cs-selected")

select_category_ajax = (form_id) ->
	categoryCsSelect = $("#{form_id} #category-select").children(".cs-select")
	affairCsSelect   = $("#{form_id} #affair-select").children(".cs-select")

	categoryCsSelect.on 'click', 'li', ->
		categoryId = $(this).attr("data-value")
		if $.isNumeric(categoryId)	
			#window.console.log 'Dzubed and id = ' + categoryId
			id = parseInt(categoryId)
			$.ajax({
				type: 'POST'
				url: '/select_category'
				data: {id: categoryId},
				success: (result) ->
					affairCsSelect 			= $(form_id).find("#affair-select")
					affairSelect 				= affairCsSelect.find("#time_set_affair_id")
					defaultLiAffair 		= '<li data-option="" data-value=""><span>chose a affair</span></li>'
					defaultOptionAffair = '<option value="">chose a affair</option>'

					# removing old fields in affair's select
					affairCsSelect.find("li").remove()
					affairSelect.children("option").remove()
					affairCsSelect.show(300)

					# adding new fields in affair's select
					# -- default
					affairCsSelect.find("ul").append defaultLiAffair
					affairSelect.append defaultOptionAffair
					# -- new field
					for i in [0...result.length]
						affairCsSelect.find("ul").append "<li data-option='' data-value='#{result[i]["id"]}'><span>#{result[i]["name"]}</span></li>"
						affairSelect.append "<option value='#{result[i]["id"]}'>#{result[i]["name"]}</option>"

					clear_select( $("#affair-select .cs-select"), 'chose a affair')
					#window.console.log "result:" + result
			})
	# adding click event for new select's field
	affairCsSelect.on 'click', 'li', ->
		affairSelect     = affairCsSelect.find("#time_set_affair_id")
		chosenAffairText = $(this).children('span').text()
		chosenAffairId   = $(this).attr "data-value"

		affairCsSelect.find('li').removeClass 'cs-selected'
		$(this).addClass "cs-selected"
		affairCsSelect.children().removeClass('cs-active')
		affairCsSelect.find('.cs-placeholder').text(chosenAffairText)
		affairSelect.val(chosenAffairId)