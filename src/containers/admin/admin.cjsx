React = require("react")

Header = require("../../components/header/header")
Footer = require("../../components/footer/footer")

Admin = React.createClass({
	render: ->
		<div>
			<Header />
			<main>
				<h2>Admin</h2>
			</main>
			<Footer />
		</div>
	})

module.exports = Admin