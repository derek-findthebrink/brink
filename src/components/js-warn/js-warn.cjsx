React = require("react")

Warn = React.createClass({
	render: ->
		styles = require("./js-warn.sass")
		<div className={styles.container}>
			<p>
				You do not have javascript enabled on this page. For the best experience, please
				enable javascript and reload this page.
			</p>
		</div>
	})

module.exports = Warn