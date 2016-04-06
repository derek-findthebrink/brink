React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")

{ContentHeader} = require("./_base")

TradeImage = React.createClass({
	render: ->
		style = {
			backgroundImage: ["url(", @props.src, ")"].join("")
		}

		<div className="trade-img">
			<a href={@props.href} target="_blank">
				<div className="img" style={style} />
			</a>
		</div>
	})


# Single Views
StackItemMain = React.createClass({
	render: ->
		<li className="stack-item">
			<TradeImage {...@props.img} />
			<div className="description">
				<h3>{@props.title}</h3>
				<span>{@props.description}</span>
			</div>
		</li>
	})

StackItemSecondary = React.createClass({
	render: ->
		<li className="stack-item">
			<TradeImage {...@props.img} />
		</li>
	})

# Stack
Stack = React.createClass({
	render: ->
		items = @props.list.map (x, i)->
			<StackItemMain key={i} {...x} />
		secondaryItems = @props.secondaryList.map (x, i)->
			<StackItemSecondary key={i} {...x} />
			
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