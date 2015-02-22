class window.StopWatch
	timeStart   = 0
	timerText   = "00:00:00"
	duration    = 0
	currentTime = new Time 0, 0, 0
	timerId	    = 0
	firstRun    = true

	#Private method. Define it up here so it's in scope
	timer 	= null

	constructor: (@timerDisplay) ->
		# private methods
		# this methods breaks inheritance
		add = =>
			currentTime.seconds++
			duration++
			if currentTime.seconds >= 60
				currentTime.seconds = 0
				currentTime.minutes++
			if currentTime.minutes >= 60
				currentTime.minutes = 0
				currentTime.hours++

			# string HH:MM:SS
			timerText = Time.convertTimeToStringHHMMSS(currentTime)
			$(@timerDisplay).text(timerText)

			timer()

		timer= =>
			timerId = setTimeout(add, 1000)

	# properties
	duration: ->
		duration

	timeStart: ->
		timeStart

	# public methods
	start: ->
		# window.console.log 'stopwatch started'
		if firstRun
			timeStart = new Date()
		timer()

	pause: ->
		# window.console.log 'stopwatch paused, timerId = ' + timerId
		# window.console.log 'time = ' + seconds
		clearTimeout(timerId)
		firstRun = false

	reset: ->
		# window.console.log 'stopwatch reset'
		clearTimeout(timerId)
		currentTime.reset()
		duration  = 0
		timerText = "00:00:00"
		firstRun  = true
		$(@timerDisplay).text(timerText)
