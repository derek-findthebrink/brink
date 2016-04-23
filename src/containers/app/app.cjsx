React = require("react")
{Link} = require("react-router")

DevTools = require("../../components/devtools.cjsx")
Footer = require("../../components/footer/footer.cjsx")
Header = require("../../components/header/header.cjsx")

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


module.exports = App