class window.TimeSet
	totalDuration = 0

	#Private method. Define it up here so it's in scope
	groupBy       = null

	constructor: (@name, @timeStart, @duration, @category) ->
		# affairName - string
		# timeStart  - UTC
		# duration 	 - seconds
		TimeSet.addDuration(@)

		# private methods
		# this methods breaks inheritance
		groupBy = (timeSets, key) =>
			uniqueTimeSets = []
			for timeSet in timeSets
				isUniqueTimeSet = true
				for uniqueTimeSet in uniqueTimeSets
					if uniqueTimeSet[key] == timeSet[key]
						uniqueTimeSet.duration += timeSet.duration
						isUniqueTimeSet = false
				if isUniqueTimeSet
					newTimeSet = ObjectFunctions.jqueryDeepCopy(newTimeSet, timeSet)
					delete newTimeSet.timeStart
					delete newTimeSet.timeStartHHMMSS
					uniqueTimeSets.push newTimeSet
			return uniqueTimeSets

	# class-level function
	@addDuration: (timeSet) ->
		totalDuration += timeSet.duration

	@groupByName: (timeSets) ->
		groupBy(timeSets, "name")

	@groupByCategory: (timeSets) -> 
		groupBy(timeSets, "category")


	@totalDuration: ->
		totalDuration

	# properties
	timeStartHHMMSS: ->
		@timeStart.toString().split(" ")[1]

	durationHHMMSS: ->
		time = Time.convertDurationToTime(@duration)
		# string time HH:MM:SS
		timerText = Time.convertTimeToStringHHMMSS(time)