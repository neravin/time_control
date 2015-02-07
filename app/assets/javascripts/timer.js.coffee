window.timer = (sec, block, direction) ->
	time = parseInt(sec)
	direction = direction || false

	hour = parseInt(time / 3600)
	if hour < 1
		hour = 0;
	time -= hour * 3600
	if hour < 10
		hour = '0' + hour

	minutes = parseInt(time / 60)
	if minutes < 1
		minutes = 0
	time -= minutes * 60
	if minutes < 10
		minutes = '0' + minutes

	seconds = time;
	if seconds < 10
		seconds = '0' + seconds

	block.text(hour + ':' + minutes + ':' + seconds)

	if direction
		sec++;
		setTimeout (->
		  timer sec, block, direction
		), 1000
	else
		sec--;
		if sec > 0
			setTimeout (->
			  timer sec, block, direction
			), 1000
		else
			alert 'time out'