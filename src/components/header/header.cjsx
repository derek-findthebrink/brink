React = require("react")
{Link} = require("react-router")

Nav = require("../nav/main-nav.cjsx")


Header = React.createClass({
	render: ->
		styles = require("./header.sass")
		<header className={styles.app}>
			<Link to="/">
				<img src="/brink-logo-small.svg" />
				<h1>brink technology co.</h1>
			</Link>
			<Nav />
		</header>
	})

module.exports = Header