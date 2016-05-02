React = require("react")
{Link} = require("react-router")
{connect} = require("react-redux")
{asyncConnect} = require("redux-async-connect")

DevTools = require("../../components/devtools.cjsx")
Footer = require("../../components/footer/footer.cjsx")
Header = require("../../components/header/header.cjsx")
Loading = require("../../components/loading/loading.cjsx")

content = require("../../../content/index.coffee")
# console.log content

App = React.createClass({
	childContextTypes: {
		content: React.PropTypes.object
	}
	getChildContext: ->
		return {content: content}
	render: ->
		if __DEVTOOLS__
			dev = <DevTools />
		else
			dev = null

		appLinks = [
			{
				to: "/products-and-services"
				title: "products"
			}
			{
				to: "/portfolio"
				title: "portfolio"
			}
			{
				to: "/about"
				title: "about"
			}
			{
				to: "/stack"
				title: "stack"
			}
			{
				to: "/contact"
				title: "contact"
			}
		]

		# apply loading module
		# if __CLIENT__
		# 	loading = <Loading />
		# else
		# 	loading = null
		loading = null
		
		<div>
			<Header links={appLinks} />
			<main>
				{@props.children}
			</main>
			{dev}
			<Footer />
			{loading}
		</div>
	})


module.exports = App