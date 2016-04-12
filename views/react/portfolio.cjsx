React = require("react")
_ = require("lodash")
$ = require("jquery")

PageContainer = require("./modules/container-page")

Portfolio = React.createClass({
	render: ->
		<PageContainer {...@props}>
			<p>portfolio content here</p>
		</PageContainer>
	})

module.exports = Portfolio