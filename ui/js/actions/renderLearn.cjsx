React = require("react")
ReactDOM = require("react-dom")
$ = require("jquery")
_ = require("lodash")

{Package, Base} = require("../views/learn")
ui = $(".content")[0]

content = require("../content/index")
console.log content:content

renderPackage = (payload)->
	console.log category:payload.category, product:payload.product
	# get props
	col = content.Products.props[payload.category]
	props = _.find col, (x)->
		x.product == payload.product
	console.log props:props, col:col
	# create element
	_v = React.createElement(Base, props)
	# render to root
	ReactDOM.render(_v, ui)

renderWebsite = (payload)->
	console.log category:payload.category, product:payload.product
	renderPackage(payload)

renderEmail = (payload)->
	console.log category:payload.category, product:payload.product
	renderPackage(payload)

renderGraphics = (payload)->
	console.log category:payload.category, product:payload.product
	renderPackage(payload)

renderApp = (payload)->
	console.log category:payload.category, product:payload.product
	renderPackage(payload)



render = (payload)->
	# console.log payload:payload
	switch payload.category
		when "packages" then renderPackage(payload)
		when "websites" then renderWebsite(payload)
		when "email" then renderEmail(payload)
		when "graphics" then renderGraphics(payload)
		when "apps" then renderApp(payload)
		else
			console.error new Error("could not parse payload " + payload.category)

module.exports = render