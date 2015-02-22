class window.TimeSet
	totalDuration = 0

	constructor: (@name, @timeStart, @duration) ->
		# affairName - string
		# timeStart  - UTC
		# duration 	 - seconds
		TimeSet.addDuration(@)

	@compare: (timeSetA, timeSetB) =>
		if timeSetA.name == timeSetB.name
			return true
		else
			return false

	# class-level function
	@addDuration: (timeSet) ->
		totalDuration += timeSet.duration

	@groupByName: (timeSets) ->
		uniqueTimeSets = []
		for timeSet in timeSets
			isUniqueTimeSet = true
			for uniqueTimeSet in uniqueTimeSets
				if uniqueTimeSet.name == timeSet.name
					uniqueTimeSet.duration += timeSet.duration
					isUniqueTimeSet = false
			if isUniqueTimeSet
				delete timeSet.timeStart
				uniqueTimeSets.push timeSet
		return uniqueTimeSets


	@totalDuration: ->
		totalDuration

	# properties
	timeStartHHMMSS: ->
		@timeStart.toString().split(" ")[4]

	durationHHMMSS: ->
		time = Time.convertDurationToTime(@duration)
		# string time HH:MM:SS
		timerText = Time.convertTimeToStringHHMMSS(time)