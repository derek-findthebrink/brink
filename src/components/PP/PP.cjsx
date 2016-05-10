React = require("react")
Footer = require("../footer/footer.cjsx")

PP = React.createClass({
	render: ->
		html = require("../../../assets/privacypolicy.html")
		<div>
			<h2>Privacy Policy</h2>
			<div dangerouslySetInnerHTML={__html: html} />
			<Footer />
		</div>
	})

module.exports = PP