React = require("react")
{Link} = require("react-router")
# {connect} = require("react-redux")

DevTools = require("./devtools")
Footer = require("./modules/footer.cjsx")
Header = require("./modules/header.cjsx")

content = require("../../../content/index.coffee")
# console.log content

App = React.createClass({
	childContextTypes: {
		content: React.PropTypes.object
	}
	getChildContext: ->
		return {content: content}
	componentDidMount: ->
		# $(".app-nav-main").slicknav({
		# 	closeOnClick: true
		# 	label: ""
		# 	brand: "<a href=\"/\">brink technology co.</a>"
		# 	init: ->
		# 		$("nav.app-nav-main, header.header-main").hide()
		# 	})
	render: ->
		if __DEVTOOLS__
			dev = <DevTools />
		else
			dev = null
		<div>
			<Header />
			<main>
				{@props.children}
			</main>
			{dev}
			<Footer />
		</div>
	})

mapStateToProps = (state)->
	return {
		appState: state
	}

# _App = connect(mapStateToProps)(App)

module.exports = App