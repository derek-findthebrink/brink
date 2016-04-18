React = require("react")

ContentHeader = require("./content-header")

PageContainer = React.createClass({
	propTypes: {
		header: React.PropTypes.object
		children: React.PropTypes.any.isRequired
	}
	render: ->
		<div>
			<ContentHeader {...@props.header} />
			{@props.children}
		</div>
	})

module.exports = PageContainer