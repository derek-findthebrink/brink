
# Helpers
# ------------------------------------
renderContent = require("./actions/renderContent")
renderLearn = require("./actions/renderLearn")
{getContent} = require('./actions/content-provider')


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
	initialize: ->
		getContent()
		require("./_router")


module.exports = Flux