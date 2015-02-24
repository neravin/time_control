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

	@groupByName: (timeSets) ->
		uniqueTimeSets = []
		for timeSet in timeSets
			isUniqueTimeSet = true
			for uniqueTimeSet in uniqueTimeSets
				if uniqueTimeSet.name == timeSet.name
					uniqueTimeSet.duration += timeSet.duration
					isUniqueTimeSet = false
			if isUniqueTimeSet
				# delete timeSet.timeStart
				newTimeSet = ObjectFunctions.jqueryDeepCopy(newTimeSet, timeSet)
				delete newTimeSet.timeStart
				delete newTimeSet.timeStartHHMMSS
				uniqueTimeSets.push newTimeSet
		return uniqueTimeSets


	@totalDuration: ->
		totalDuration

	# properties
	timeStartHHMMSS: ->
		@timeStart.toString().split(" ")[1]

	durationHHMMSS: ->
		time = Time.convertDurationToTime(@duration)
		# string time HH:MM:SS
		timerText = Time.convertTimeToStringHHMMSS(time)