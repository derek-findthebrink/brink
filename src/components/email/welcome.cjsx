React = require("react")

Welcome = React.createClass({
	render: ->
		styles = require("./email.sass")
		<div className={styles.container}>
			<h2>Welcome to Brink!</h2>
		</div>
	})

module.exports = Welcome