React = require("react")
{Link} = require("react-router")


Nav = React.createClass({
	render: ->
		styles = require("./main-nav.sass")
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