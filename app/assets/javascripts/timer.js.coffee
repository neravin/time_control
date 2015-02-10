class window.StopWatch
		timerText   = "00:00:00"
		seconds 		= 0
		minutes 		= 0
		hours	 			= 0
		timerId			= 0

		#Private method. Define it up here so it's in scope
		timer 	= null

		constructor: (@timerDisplay) ->
			# private methods
			# this methods breaks inheritance
			add = =>
				seconds++
				if seconds >= 60
					seconds = 0
					minutes++
				if minutes >= 60
					minutes = 0
					hours++

				# output time
				if hours < 10
					timerText = '0' + hours
				else
					timerText = hours
				timerText += ":"
				if minutes < 10
					timerText += '0' + minutes
				else
					timerText += minutes
				timerText += ":"
				if seconds < 10
					timerText += '0' + seconds
				else
					timerText += seconds
				$(@timerDisplay).text(timerText)

				timer()

			timer= =>
				timerId = setTimeout(add, 1000)

		# public methods
		start: ->
			# window.console.log 'stopwatch started'
			timer()

		pause: ->
			# window.console.log 'stopwatch paused, timerId = ' + timerId
			clearTimeout(timerId)

		reset: ->
			# window.console.log 'stopwatch reset'
			clearTimeout(timerId)
			seconds = 0
			minutes = 0
			hours   = 0
			timerText = "00:00:00"
			$(@timerDisplay).text(timerText)
