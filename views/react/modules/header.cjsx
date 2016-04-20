React = require("react")
{Link} = require("react-router")
CSSModules = require("react-css-modules")

Nav = require("./main-nav")

styles = require("modules/header.sass")

Header = React.createClass({
	render: ->
		<header className={styles.app}>
			<Link to="/">
				<img src="/brink-logo-small.svg" />
				<h1>brink technology co.</h1>
			</Link>
			<Nav />
		</header>
	})

module.exports = CSSModules(Header, styles)