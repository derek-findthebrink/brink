React = require("react")
_ = require("lodash")
$ = require("jquery")

{ContentHeader, HorizontalMenu} = require("./_base")

Home = React.createClass({
	render: ->
		<div className="page-home">
			<ContentHeader {...@props.header} />
		</div>
	})

module.exports = Home