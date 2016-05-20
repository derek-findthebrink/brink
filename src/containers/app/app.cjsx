React = require("react")
{Link} = require("react-router")
{connect} = require("react-redux")
{asyncConnect} = require("redux-async-connect")
Helmet = require("react-helmet")

DevTools = require("../../components/devtools.cjsx")
Footer = require("../../components/footer/footer.cjsx")
Header = require("../../components/header/header.cjsx")
Loading = require("../../components/loading/loading.cjsx")
{JSWarn, CookieWarn} = require("../../components/js-warn/js-warn.cjsx")

content = require("../../../content/index.coffee")
config = require("../../config")


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
			{to: "/", title: "home"}
			{to: "/products-and-services", title: "products"}
			{to: "/portfolio", title: "portfolio"}
			{to: "/about", title: "about"}
			{to: "/stack", title: "stack"}
			{to: "/contact", title: "contact"}
		]
		<div key="main-app">
			<Helmet {...config.app.head} />
			<JSWarn />
			<Header links={appLinks} />
			<main>
				<CookieWarn />
				{@props.children}
			</main>
			{dev}
			<Footer />
		</div>
	})


module.exports = App