class window.TimeSet
	totalDuration = 0

	constructor: (@name, @timeStart, @duration) ->
		# affairName - string
		# timeStart  - UTC
		# duration 	 - seconds
		TimeSet.addDuration(@)

	# class-level function
	@addDuration: (timeSet) ->
		totalDuration += timeSet.duration

	@totalDuration: ->
		totalDuration

	# properties
	timeStartHHMMSS: ->
		@timeStart.toString().split(" ")[4]

	durationHHMMSS: ->
		time = Time.convertDurationToTime(@duration)
		# string time HH:MM:SS
		timerText = Time.convertTimeToStringHHMMSS(time)