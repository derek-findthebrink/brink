# slicknav options
navOpts = {
	label: ""
	brand: "brink technology co."
	init: ->
		$("nav").hide()
}

# initialize slicknav
$("nav").slicknav( navOpts )

console.log "slicknav loaded"