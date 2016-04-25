React = require("react")

ContentHeader = require("../content-header/content-header.cjsx")
Loading = require("../loading/loading.cjsx")

PageContainer = React.createClass({
	propTypes: {
		header: React.PropTypes.object
		children: React.PropTypes.any.isRequired
	}
	render: ->
		<div style={{position: "relative"}}>
			<ContentHeader {...@props.header} />
			{@props.children}
		</div>
	})

module.exports = PageContainer