React = require("react")
_ = require("lodash")
$ = require("jquery")

{ContentHeader, HorizontalMenu} = require("./_base")

Portfolio = React.createClass({
	render: ->
		<div>
			<ContentHeader {...@props.header} />
		</div>
	})

module.exports = Portfolio