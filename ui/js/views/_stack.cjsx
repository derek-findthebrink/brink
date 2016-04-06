React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")

{ContentHeader} = require("./_base")

TradeImage = React.createClass({
	render: ->
		<div className="trade-img">
			<a href={@props.href}>
				<img src={@props.src} alt={@props.alt} />
			</a>
		</div>
	})


# Single Views
StackItem = React.createClass({
	render: ->
		<li className="stack-item">
			<TradeImage {...@props.img} />
			<div className="description">
				<h3>{@props.title}</h3>
				<span>{@props.description}</span>
			</div>
		</li>
	})

# Stack
Stack = React.createClass({
	render: ->
		items = @props.list.map (x, i)->
			<StackItem key={i} {...x} />
		secondaryItems = @props.secondaryList.map (x, i)->
			<StackItem key={i} {...x} />
			
		<div className="stack">
			<ContentHeader {...@props.header} />
			<ul className="stack-list-main">
				{items}
			</ul>
			<ul className="stack-list-secondary">
				{secondaryItems}
			</ul>
		</div>
	})

module.exports = Stack