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
		items = ["products", "contacts", "stack"]

		stats = items.map (x, i)->
			<StatsItem title={x} key={i} />

		<div>
			<h2>Admin Dashboard</h2>
			<p>you are logged in as: {@props.username}</p>
			<a href="/admin/logout">logout</a>
			<ul className="stats-container">
				{stats}
			</ul>
		</div>
	})

module.exports = Dashboard