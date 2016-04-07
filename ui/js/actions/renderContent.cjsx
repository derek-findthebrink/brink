React = require("react")
ReactDOM = require("react-dom")
$ = require("jquery")
_ = require("lodash")

ui = $(".content")[0]
_c = require("../content/index")


Home = require("../views/home")
Portfolio = require("../views/portfolio")
Stack = require("../views/stack")
Products = require("../views/product")
Contact = require("../views/contact")

Views = {
	"Home": Home
	"Portfolio": Portfolio
	"Stack": Stack
	"Products": Products
	"Contact": Contact
}


_contentMatch = (payload)->
	return _c[payload.page]

_pageMatch = (page)->
	_v = Views[page.view]
	return _v

renderContent = (payload)->
	# console.log payload:payload, "renderContent"
	c = _contentMatch(payload)
	props = c.props
	view = _pageMatch(c)
	if payload.sub
		props.list = c.props[payload.sub]
	# console.log props:props, "props"
	v = React.createElement(view, props)
	ReactDOM.render(v, ui)


module.exports = renderContent