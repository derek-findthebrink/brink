React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")

Dashboard = React.createClass({
	render: ->
		<div>
			<h2>Admin Dashboard</h2>
			<p>you are logged in as: {@props.username}</p>
		</div>
	})

module.exports = Dashboard