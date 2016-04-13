React = require("react")

ContentHeader = React.createClass({
	propTypes: {
		title: React.PropTypes.string.isRequired
		description: React.PropTypes.string
	}
	render: ->
		<div className="header-section">
			<div className="header-inner">
				<img className="header-logo" src="/brink-logo-small.svg" alt="products" />
				<div className="header-copy">
					<h2 className="page-header">{@props.title}</h2>
					<p className="page-header-description">{@props.description}</p>
				</div>
			</div>
		</div>
	})


module.exports = ContentHeader