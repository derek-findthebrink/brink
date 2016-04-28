React = require("react")

Header = require("../../components/header/header.cjsx")

Admin = React.createClass({
	render: ->

		adminLinks = [
			{
				to: "/"
				title: "dashboard"
			}
		]

		<div>
			<Header links={adminLinks} title="brink admininstration" titleLink="/admin" />
			<main>
				<h2>Admin</h2>
				{@props.children}
			</main>
		</div>
	})

module.exports = Admin