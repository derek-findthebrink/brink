React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")

Dashboard = React.createClass({
	render: ->
		<div>
			<h2>Admin Dashboard</h2>
			<p>you are logged in as: {@props.username}</p>
			<a href="/admin/logout">logout</a>
		</div>
	})

module.exports = Dashboard