React = require("react")
$ = require("jquery")
_ = require("lodash")

Header = React.createClass({
	render: ->
		<div>
			<h2>{@props.title}</h2>
		</div>
	})