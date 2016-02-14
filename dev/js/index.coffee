# window.$ = require "jquery"
window._ = require "underscore"
window.Backbone = require "backbone"
window.React = require "react"
window.ReactDOM = require "react-dom"
require "jquery-ui"
window.moment = require "moment"

# slicknav options
navOpts = {
	label: ""
	brand: "brink technology co."
	init: ->
		$("nav").hide()
}

# initialize slicknav
$("nav").slicknav( navOpts )
