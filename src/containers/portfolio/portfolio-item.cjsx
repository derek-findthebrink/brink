React = require("react")

PortfolioItem = React.createClass({
	render: ->
		styles = require("./portfolio.sass")
		<div className={styles.row}>
			<h2>{@props.title}</h2>
		</div>
	})

module.exports = PortfolioItem