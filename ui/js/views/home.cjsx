React = require("react")
_ = require("lodash")
$ = require("jquery")

{ContentHeader, HorizontalMenu, PageContainer} = require("./_base")

Home = React.createClass({
	render: ->
		<PageContainer {...@props}>
			<p>hi there!</p>
		</PageContainer>
	})

module.exports = Home