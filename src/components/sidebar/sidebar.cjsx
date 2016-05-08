React = require("react")
{Link} = require("react-router")

Sidebar = React.createClass({
	render: ->
		styles = require("./sidebar.sass")
		<div className={[@props.className, styles.container].join(" ")}>
			<h2>{@props.title}</h2>
			{@props.children}
		</div>
	})

module.exports = Sidebar