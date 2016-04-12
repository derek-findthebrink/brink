# slicknav options
initSticky = ->
	$el = $(".slicknav_menu")
	$el.sticky({
		topSpacing: 0
		})

navOpts = {
	closeOnClick: true
	label: ""
	brand: "<a href=\"/\">brink technology co.</a>"
	init: ->
		$("nav, header").hide()
}

# initialize slicknav
$(".main-nav").slicknav( navOpts )