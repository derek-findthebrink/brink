React = require("react")
{Link} = require("react-router")

EditBase = React.createClass({
	render: ->
		<div>
			<h2>Edit Base</h2>
			<Link to="/admin/edit/products">Edit Products</Link><br />
			<Link to="/admin/edit/stack">Edit Stack</Link>
		</div>
	})

module.exports = EditBase