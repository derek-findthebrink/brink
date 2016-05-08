React = require("react")
{Link} = require("react-router")

Sidebar = require("../sidebar/sidebar.cjsx")

EditBase = React.createClass({
	render: ->
		styles = require("./edit.sass")
		<div>
			<Sidebar title="edit">
				<Link to="/admin/edit/products">Products</Link>
				<Link to="/admin/edit/stack">Stack</Link>
				<Link to="/admin/edit/portfolio">Portfolio</Link>
				<Link to="/admin/edit/about">About</Link>
			</Sidebar>
			{@props.children}
		</div>
	})

module.exports = EditBase