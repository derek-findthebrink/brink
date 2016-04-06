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

exports.ContentHeader = ContentHeader



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








ProductItem = React.createClass({
	learn: (e)->
		e.preventDefault()
		h = e.target.href
		app.flux.dispatch({
			action: "href_navigate"
			href: h
			})
	render: ->
		_hrefLearn = ["/products-and-services", @props.category, @props.product].join("/")
		includes = null
		if @props.includes
			includes = @props.includes.map (x, i)->
				<li key={i}>{x}</li>
		else
			includes = <li>no includes provided</li>

		<li className="product-item">
			<div className="img">
				<img src="/brink-logo-small.svg" alt="brink logo" />
			</div>
			<div className="description">
				<h2 className="product-header">{@props.title}</h2>
				<p className="summary">{@props.description}</p>
				<ul className="includes">
					{includes}
				</ul>
				<div className="action-callout">
					<a onClick={@learn} href={_hrefLearn} className="learn">learn more</a>
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



Field = React.createClass({
	render: ->
		label = @props.label || @props.name
		type = @props.type
		_i = null
		if type == "textarea"
			_i = React.createElement("textarea", @props)
		else if type == "select"
			_i = React.createElement("select", @props)
		else
			_i = React.createElement("input", @props)

		<div className="field-container">
			<label htmlFor={@props.name}>{label}</label>
			<div className="field">
				{_i}
			</div>
		</div>
	})

# Contact
Contact = React.createClass({
	render: ->
		<div className="contact">
			<ContentHeader {...@props.header} />
			<form>
				<Field name="name" />
				<Field name="email_address" label="email address" />
				<Field name="product" />
				<Field name="description" type="textarea" />
			</form>
		</div>
	})

exports.pages = {
	Products
	Contact
}