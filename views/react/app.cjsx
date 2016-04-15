React = require("react")
{Link} = require("react-router")

Footer = require("./modules/footer")
Header = require("./modules/header")

content = require("../../content/index")
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
		<div>
			<link rel="stylesheet" href="/app.css" />
			<Header />
			<main>
				{@props.children}
			</main>
			<Footer />
		</div>
	})

module.exports = App