React = require("react")

TradeImage = require("./widget-trade-image")


# Single Views
StackItemMain = React.createClass({
	render: ->
		<li className="stack-item">
			<TradeImage {...@props.img} title={@props.title} />
			<div className="description">
				<h3 className="trade-image-header">{@props.title}</h3>
				<span>{@props.description}</span>
			</div>
		</li>
	})

StackItemSecondary = React.createClass({
	render: ->
		<li className="stack-item">
			<TradeImage {...@props.img} title={@props.title} overlay={true} />
		</li>
	})

module.exports = {
	StackItemMain
	StackItemSecondary
}