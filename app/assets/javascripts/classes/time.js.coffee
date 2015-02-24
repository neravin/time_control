class window.Time
	constructor: (@hours, @minutes, @seconds) ->
		return

	# class-level function
	@convertTimeToStringHHMMSS: (time) ->
		# convert hours, minutes and seconds to string (HH:MM:SS)
		if time.hours < 10
			timerText = '0' + time.hours
		else
			timerText = time.hours
		timerText += ":"
		if time.minutes < 10
			timerText += '0' + time.minutes
		else
			timerText += time.minutes
		timerText += ":"
		if time.seconds < 10
			timerText += '0' + time.seconds
		else
			timerText += time.seconds

	@convertDurationToTime: (duration) ->
		hours   = parseInt( duration / 3600 )
		minutes = parseInt( duration / 60 ) % 60
		seconds = duration % 60
		time = new Time hours, minutes, seconds

	@convertDateToUTC: (dateIn) ->
		time = new Time(dateIn.getHours(), dateIn.getMinutes(),  dateIn.getSeconds())
		utc = (dateIn.getFullYear() + "-" + (dateIn.getMonth()+1) + "-" + dateIn.getDate() + 
		" " + Time.convertTimeToStringHHMMSS(time) + " UTC")

	# public methods
	reset: ->
		@hours   = 0
		@minutes = 0
		@seconds = 0