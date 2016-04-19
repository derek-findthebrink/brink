React = require("react")
{Link} = require("react-router")

styles = require("modules/main-nav.sass")

Nav = React.createClass({
	render: ->
		<nav className={styles.main}>
			<ul>
				<li><Link to="/products-and-services">products</Link></li>
				<li><Link to="/portfolio">portfolio</Link></li>
				<li><Link to="/about">about</Link></li>
				<li><Link to="/stack">stack</Link></li>
				<li><Link to="/contact">contact</Link></li>
			</ul>
		</nav>
	})

module.exports = Nav