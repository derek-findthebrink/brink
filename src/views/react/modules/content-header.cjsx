React = require("react")


ContentHeader = React.createClass({
	propTypes: {
		title: React.PropTypes.string.isRequired
		description: React.PropTypes.string
	}
	render: ->
		styles = require("./content-header.sass")
		if @props.background
			style = {
				backgroundImage: "url(" + @props.background + ")"
			}
		else
			style = null

		<div className={styles.container} style={style}>
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