React = require("react")

styles = require("modules/content-header.sass")

ContentHeader = React.createClass({
	propTypes: {
		title: React.PropTypes.string.isRequired
		description: React.PropTypes.string
	}
	render: ->
		<div className={styles.container}>
			<div className={styles.inner}>
				<img className={styles.logo} src="/brink-logo-small.svg" alt="products" />
				<div className={styles.copy}>
					<h2>{@props.title}</h2>
					<p>{@props.description}</p>
				</div>
			</div>
		</div>
	})


module.exports = ContentHeader