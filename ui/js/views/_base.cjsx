React = require("react")
$ = require("jquery")
_ = require("lodash")


# Base
# ------------------------------

ContentHeader = React.createClass({
	render: ->
		<div className="header-section">
			<h2 className="page-header">{@props.title}</h2>
			<p className="page-header-description">{@props.description}</p>
		</div>
	})






# Components
# -----------------------------------

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
			<a className="app-nav" href={@props.link}>{@props.title}</a>
		</li>
	})

HorizontalMenu = React.createClass({
	componentDidMount: ->
		try
			app.router.listeners()
		catch e
			console.log "click event handler initialization via router failed, retrying..."
	render: ->
		items = @props.menu.map (x, i)->
			<MenuItem {...x} key={i} />

		<div className="horizontal-menu">
			<ul>
				{items}
			</ul>
		</div>
	})

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



ProductItem = React.createClass({
	render: ->
		<div className="product-item">
			<div className="img">
				<img src="/brink-logo-small.svg" alt="brink logo" />
			</div>
			<div className="description">
				<h3>{@props.title}</h3>
				<p>{@props.description}</p>
			</div>
		</div>
	})



exports.content = {
	# Header
	ContentHeader
}






# Stack
# ----------------------------


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
		try
			items = @props.list.map (x, i)->
				<ProductItem {...x} key={i} />
		catch e
			items = <ProductItem title="no items available" />
		<div className="products">
			<ContentHeader {...@props.header} />
			<HorizontalMenu menu={@props.menu} />
			<ul className="products-list">
				{items}
			</ul>
		</div>		
	})


exports.pages = {
	Stack
	Products
}