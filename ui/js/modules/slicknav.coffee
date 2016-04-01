# slicknav options
navOpts = {
	closeOnClick: true
	label: ""
	brand: "<a href=\"/\">brink technology co.</a>"
	init: ->
		$("nav").hide()
}

# initialize slicknav
$("nav").slicknav( navOpts )
