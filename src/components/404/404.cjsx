React = require("react")
App = require("../../containers/app/app.cjsx")
Helmet = require("react-helmet")

NotFound = React.createClass({
	render: ->
		styles = require("./404.sass")
		<App>
			<Helmet title="Not Found" />
			<div className={styles.container}>
				<h2>404</h2>
				<p>Not Found</p>
				<h3>Sorry, we couldn't find that!</h3>
			</div>
		</App>
	})

module.exports = NotFound