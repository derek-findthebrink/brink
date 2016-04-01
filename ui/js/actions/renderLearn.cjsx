renderPackage = (payload)->
	console.log category:payload.category, product:payload.product

renderWebsite = (payload)->
	console.log category:payload.category, product:payload.product

renderEmail = (payload)->
	console.log category:payload.category, product:payload.product

renderGraphics = (payload)->
	console.log category:payload.category, product:payload.product

renderApp = (payload)->
	console.log category:payload.category, product:payload.product



render = (payload)->
	# console.log payload:payload
	switch payload.category
		when "package" then renderPackage(payload)
		when "website" then renderWebsite(payload)
		when "email" then renderEmail(payload)
		when "graphics" then renderGraphics(payload)
		when "app" then renderApp(payload)
		else
			console.error new Error("could not parse payload " + payload.category)

module.exports = render