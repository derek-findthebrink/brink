React = require("react")

TradeImage = React.createClass({
	render: ->
		imgSrc = @props.src || "/brink-logo-small.svg"
		if imgSrc == ""
			imgSrc = "/brink-logo-small.svg"
		style = {
			backgroundImage: ["url(", imgSrc, ")"].join("")
		}

		overlay = null
		if @props.overlay
			overlay = (
				<div className="overlay">
					<h4 className="overlay-text">{@props.title}</h4>
				</div>
				)

		<div className="trade-img">
			<a href={@props.href} target="_blank">
				<div className="img" style={style} />
				{overlay}
			</a>
		</div>
	})

module.exports = TradeImage