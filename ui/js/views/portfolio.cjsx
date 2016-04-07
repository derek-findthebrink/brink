React = require("react")
_ = require("lodash")
$ = require("jquery")

{ContentHeader, HorizontalMenu, PageContainer} = require("./_base")

Portfolio = React.createClass({
	render: ->
		<PageContainer {...@props}>
			<p>portfolio content here</p>
		</PageContainer>
	})

module.exports = Portfolio