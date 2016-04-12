React = require("react")
ReactDOM = require("react-dom")
$ = require("jquery")
_ = require("lodash")

ui = $(".content")[0]
# console.log _c:_c

VIEW_DIR = "../../../../views/react/"
CONTENT_DIR = "../../../../content/"

_c = require(CONTENT_DIR + "index")

Home = require VIEW_DIR + "home"
Portfolio = require VIEW_DIR + "portfolio"
Stack = require VIEW_DIR + "stack"
Products = require VIEW_DIR + "product"
Contact = require VIEW_DIR + "contact"

Views = {
	"Home": Home
	"Portfolio": Portfolio
	"Stack": Stack
	"Products": Products
	"Contact": Contact
}


_contentMatch = (payload)->
	x = _c[payload.page]
	x.props.user = User
	# console.log x:x
	return x 

_pageMatch = (page)->
	_v = Views[page.view]
	return _v

renderContent = (payload)->
	# console.log payload:payload, "renderContent"
	c = _contentMatch(payload)
	props = c.props
	view = _pageMatch(c)
	if payload.sub
		# return only items related to sub view
		# console.log content:c
		props.items = _.filter c.props.list, (x)->
			return x.category == payload.sub
	if payload.merge
		props = _.extend props, payload.merge
	# console.log props:props, "props"
	v = React.createElement(view, props)
	ReactDOM.render(v, ui)


module.exports = renderContent