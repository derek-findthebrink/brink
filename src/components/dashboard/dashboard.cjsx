React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")


DashboardItem = React.createClass({
	render: ->
		<li>
			<h3>{@props.title}</h3>
		</li>
	})


Dashboard = React.createClass({
	render: ->
		styles = require("./dashboard.sass")
		<div className={styles.container}>
			<ul>
				<DashboardItem title="messages" />
				<DashboardItem title="new contacts" />
				<DashboardItem title="analytics" />
				<DashboardItem title="open projects" />
				<DashboardItem title="content" />
				<DashboardItem title="library" />
			</ul>
		</div>
	})

module.exports = Dashboard