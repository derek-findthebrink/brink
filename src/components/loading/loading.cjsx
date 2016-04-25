React = require("react")

Loading = React.createClass({
	render: ->
		styles = require("./loading.sass")
		<div className={styles.container}>
			<div>
				<img src="/brink-logo-small.svg" />
				<h1>brink technology co.</h1>
			</div>
		</div>
	})

module.exports = Loading