class window.TimeSet
	constructor: (@name, @timeStart, @duration) ->
		# affairName - string
		# timeStart  - UTC
		# duration 	 - seconds

	# properties
	timeStartHHMMSS: ->
		@timeStart.toString().split(" ")[4]

	durationHHMMSS: ->
		seconds   = 0
		minutes   = 0
		hours	    = 0
		
		hours = parseInt( @duration / 3600 )
		minutes = parseInt (@duration / 60) % 60
		seconds = @duration % 60

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
		return timerText