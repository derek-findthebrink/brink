React = require("react")
{Link} = require("react-router")

Sidebar = require("../sidebar/sidebar.cjsx")

EditBase = React.createClass({
	render: ->
		styles = require("./edit.sass")
		<div>
			<Sidebar title="edit">
				<Link to="/admin/edit/products">Products</Link><br />
				<Link to="/admin/edit/stack">Stack</Link>
			</Sidebar>
			{@props.children}
		</div>
	})

module.exports = EditBase