React = require("react")
App = require("../../containers/app/app.cjsx")

NotFound = React.createClass({
	render: ->
		styles = require("./404.sass")
		<App>
			<div className={styles.container}>
				<h2>404</h2>
				<p>Not Found</p>
				<h3>Sorry, we couldn't find that!</h3>
			</div>
		</App>
	})

module.exports = NotFound