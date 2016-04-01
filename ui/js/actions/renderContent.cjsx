React = require("react")
ReactDOM = require("react-dom")
$ = require("jquery")
_ = require("lodash")

ui = $(".content")[0]
_c = require("../content/index")
console.log _c


_contentMatch = (payload)->
	return _c[payload.page]

renderContent = (payload)->
	# console.log payload:payload, "renderContent"
	c = _contentMatch(payload)
	props = c.props
	view = c.view
	if payload.sub
		props.list = c.props[payload.sub]
	# console.log props:props, "props"
	v = React.createElement(view, props)
	ReactDOM.render(v, ui)


module.exports = renderContent