React = require("react")

TAC = React.createClass({
	render: ->
		html = require("../../../assets/terms-and-conditions.html")
		styles = require("./TAC.sass")
		<div className={styles.container}>
			<h2 className={styles.title}>Terms and Conditions</h2>
			<div dangerouslySetInnerHTML={__html: html} />
		</div>
	})

module.exports = TAC