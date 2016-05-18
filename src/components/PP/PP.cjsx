React = require("react")
Footer = require("../footer/footer.cjsx")

PP = React.createClass({
	render: ->
		html = require("../../../assets/privacypolicy.html")
		styles = require("./PP.sass")
		<div className={styles.container}>
			<h2 className={styles.title}>Privacy Policy</h2>
			<div dangerouslySetInnerHTML={__html: html} />
		</div>
	})

module.exports = PP