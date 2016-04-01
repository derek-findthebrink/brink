React = require("react")
ReactCSSTransitionGroup = require("react-addons-css-transition-group")
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




# Menus
MenuItem = React.createClass({
	render: ->
		classes = ["app-nav"]
		if @props.addClass
			classes.push(@props.addClass)
		c = classes.join(" ")
		<li>
			<a className={c} href={@props.link}>{@props.title}</a>
		</li>
	})

HorizontalMenu = React.createClass({
	componentDidMount: ->
		try
			app.router.listeners()
		catch e
			console.log "click event handler initialization via router failed, retrying..."

	render: ->
		path = location.pathname
		items = @props.menu.map (x, i)->
			if x.link == path
				<MenuItem {...x} key={i} addClass="active" />
			else
				<MenuItem {...x} key={i} />

		<div className="horizontal-menu">
			<ul>
				{items}
			</ul>
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



ProductItem = React.createClass({
	learn: (e)->
		e.preventDefault()
		h = e.target.href
		app.flux.dispatch({
			action: "href_navigate"
			href: h
			})
	render: ->
		<li className="product-item">
			<div className="img">
				<img src="/brink-logo-small.svg" alt="brink logo" />
			</div>
			<div className="description">
				<h2 className="product-header">{@props.title}</h2>
				<p className="summary">{@props.description}</p>
				<ul className="includes">
					<li>a hat</li>
					<li>real friendly customer service</li>
				</ul>
				<div className="action-callout">
					<a onClick={@learn} href={@props.learn} className="learn">learn more</a>
					<a onClick={@navigate} href="#" className="quote">quote</a>
				</div>
			</div>
		</li>
	})




# Custom Segments
# ----------------------------------

Content = React.createClass({
	render: ->
		<div>
			<ContentHeader {...@props.header} />
			{@props.children}
		</div>
	})

exports.Main = Content

# Stack
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
k = 0
Products = React.createClass({
	render: ->
		try
			items = @props.list.map (x, i)->
				<ProductItem {...x} key={k++} />
		catch e
			items = <ProductItem title="no items available" />
		<div className="products">
			<ContentHeader {...@props.header} />
			<HorizontalMenu menu={@props.menu} />
			<ul className="products-list">
				<ReactCSSTransitionGroup 
				transitionName="product-transition" 
				transitionAppear={true} 
				transitionAppearTimeout={1000} 
				transitionEnterTimeout={1000} 
				transitionLeave={false}
				transitionLeaveTimeout={1000}>
					{items}
				</ReactCSSTransitionGroup>
			</ul>
		</div>		
	})


exports.pages = {
	Stack
	Products
}