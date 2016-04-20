React = require("react")
{render} = require("react-dom")
$ = require("jquery")

{browserHistory, match, Router} = require("react-router")
views = require("views/react/index")
router = require("router/app-router")

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
		console.log payload:payload, "flux"
		switch payload.action
			when "render_content" then renderContent(payload)
			# when "render_learn" then renderLearn(payload)
			# when "href_navigate" then hrefNavigate(payload)
			else
				console.error new Error("could not parse payload: " + payload.action)
	initialize: ->
		container = $("#app-container")[0]
		history = browserHistory		
		routes = router(history, views)
		match({history, routes}, (err, redirect, renderProps)->
			render(<Router {...renderProps} />, container)
			)


module.exports = Flux