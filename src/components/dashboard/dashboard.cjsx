React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")


StatsItem = React.createClass({
	render: ->
		href = ["/admin/edit", @props.title].join("/")

		<li>
			<h3>{@props.title}</h3>
			<a href={href}>edit {@props.title}</a>
		</li>
	})


Dashboard = React.createClass({
	render: ->
		<div>
			<h2>Dashboard</h2>
			<div>
				<h3>Unique Visits</h3>
			</div>
			<div>
				<h3>Contact Requests</h3>
			</div>
			<div>
				<h3>Active Clients</h3>
			</div>

		</div>
	})

module.exports = Dashboard