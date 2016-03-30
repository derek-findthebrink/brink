React = require("react")
$ = require("jquery")
_ = require("lodash")


# Base
# ------------------------------

Header = React.createClass({
	render: ->
		<div>
			<h2>{@props.title}</h2>
		</div>
	})

ContentHeader = React.createClass({
	render: ->
		<div className="header-section">
			<h2 className="page-header">{@props.title}</h2>
			<p className="page-header-description">{@props.description}</p>
		</div>
	})

TradeImage = React.createClass({
	render: ->
		<div className="img">
			<a href={@props.href}>
				<img src={@props.src} alt={@props.alt} />
			</a>
		</div>
	})

MenuItem = React.createClass({
	render: ->
		<li>
			<a href={@props.link}>{@props.title}</a>
		</li>
	})

HorizontalMenu = React.createClass({
	render: ->
		items = @props.menu.map (x, i)->
			<MenuItem {...x} key={i} />

		<div className="horizontal-menu">
			<ul>
				{items}
			</ul>
		</div>
	})

exports.content = {
	Header
	ContentHeader
}

# Stack
# ----------------------------

StackItem = React.createClass({
	render: ->
		<li>
			<TradeImage {...@props.img} />
			<div className="description">
				<h3>{@props.title}</h3>
				<span>{@props.description}</span>
			</div>
		</li>
	})

Stack = React.createClass({
	render: ->
		items = @props.list.map (x, i)->
			<StackItem key={i} {...x} />
			
		<div className="stack">
			<ContentHeader {...@props.header} />
			<ul className="stack-list">
				{items}
			</ul>
		</div>
	})

# Products
# ----------------------------------
Products = React.createClass({
	render: ->
		<div className="products">
			<ContentHeader {...@props.header} />
			<HorizontalMenu menu={@props.menu} />
			<p>hi!</p>
		</div>		
	})


exports.pages = {
	Stack
	Products
}