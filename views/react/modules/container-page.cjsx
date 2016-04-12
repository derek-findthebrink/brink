React = require("react")

ContentHeader = require("./content-header")

PageContainer = React.createClass({
	render: ->
		cssClasses = ["page"]
		if @props.CSSClass
			cssClasses.push @props.CSSClass
		cssFinal = cssClasses.join(" ")

		<div className={cssFinal}>
			<ContentHeader {...@props.header} />
			{@props.children}
		</div>
	})

module.exports = PageContainer