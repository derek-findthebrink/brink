React = require("react")
{Link} = require("react-router")

Header = React.createClass({
	render: ->
		links = @props.links.map (x, i)->
			<li key={i}>
				<Link to={x.to}>{x.title}</Link>
			</li>

		title = @props.title || "brink technology co."
		titleTo = @props.titleLink || "/"

		styles = require("./header.sass")
		<header className={styles.app}>
			<Link to={titleTo}>
				<img src="/brink-logo-small.svg" />
				<h1>{title}</h1>
			</Link>
			<nav className={styles.nav}>
				<ul>
					{links}
				</ul>
			</nav>
		</header>
	})

module.exports = Header