
# Helpers
# ------------------------------------
renderContent = require("./actions/renderContent")
renderLearn = require("./actions/renderLearn")


hrefNavigate = (payload)->
	app.router.hrefNavigator(payload.href)

# Flux Class
# ---------------------------------------
class Flux
	constructor: ->
		@_views = []
	dispatch: (payload)->
		# console.log payload:payload, "flux"
		switch payload.action
			when "render_content" then renderContent(payload)
			when "render_learn" then renderLearn(payload)
			when "href_navigate" then hrefNavigate(payload)
			else
				console.error new Error("could not parse payload: " + payload.action)
	registerView: (name, view)->
		@_views[name] = view
		console.log "registered view:", {name: name, view: view}

module.exports = Flux