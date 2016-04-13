React = require("react")
_ = require("lodash")
$ = require("jquery")

PageContainer = require("./modules/container-page")

Portfolio = React.createClass({
	getInitialState: ->
		return app.content.Portfolio
	render: ->
		<PageContainer {...@state}>
			<p>portfolio content here</p>
		</PageContainer>
	})

module.exports = Portfolio