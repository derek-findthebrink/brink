React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")

{ContentHeader, PageContainer} = require("./_base")

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
		_primary = _.filter @props.list, (x)->
			x.secondary == false
		_secondary = _.filter @props.list, (x)->
			x.secondary == true
		primary = _primary.map (x, i)->
			<StackItemMain key={i} {...x} />
		secondary = _secondary.map (x, i)->
			<StackItemSecondary key={i} {...x} />
			
		<PageContainer {...@props}>
			<ul className="stack-list-main">
				{primary}
			</ul>
			<ul className="stack-list-secondary">
				{secondary}
			</ul>
		</PageContainer>
	})

module.exports = Stack