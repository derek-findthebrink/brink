class Flux
	constructor: ->
		@_views = []
	dispatch: (payload)->
		console.log payload:payload, "flux"
		switch payload.action
			when "render_content" then renderContent(payload)
			else
				console.error new Error("could not parse payload", payload)

module.exports = Flux