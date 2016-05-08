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
		</div>
	})

module.exports = Dashboard