React = require("react")
_ = require("lodash")

PageContainer = require("./modules/container-page")

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