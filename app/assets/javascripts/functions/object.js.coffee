class window.ObjectFunctions
	@jsonCopy: (receiver, source) ->
		receiver = JSON.parse(JSON.stringify(source))

	@jqueryDeepCopy: (receiver, source) ->
		receiver = jQuery.extend true, {}, source