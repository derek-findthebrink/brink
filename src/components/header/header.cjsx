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
		if @props.admin
			containerClass = styles.admin
		else
			containerClass = styles.app
			# add admin styles/features here

		<header className={containerClass}>
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