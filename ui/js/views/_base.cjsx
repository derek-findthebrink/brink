React = require("react")
ReactDOM = require("react-dom")
ReactCSSTransitionGroup = require("react-addons-css-transition-group")
$ = require("jquery")
_ = require("lodash")


# Base
# ------------------------------

ContentHeader = React.createClass({
	render: ->
		<div className="header-section">
			<div className="header-inner">
				<img className="header-logo" src="/brink-logo-small.svg" alt="products" />
				<div className="header-copy">
					<h2 className="page-header">{@props.title}</h2>
					<p className="page-header-description">{@props.description}</p>
				</div>
			</div>
		</div>
	})


exports.ContentHeader = ContentHeader


# Components
# -----------------------------------

# Horizontal Menu
MenuItem = React.createClass({
	render: ->
		classes = ["app-nav"]
		if @props.addClass
			classes.push(@props.addClass)
		c = classes.join(" ")
		<li className={@props.addClass || null}>
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
		# path = location.pathname
		items = @props.menu.map (x, i)->
			# Removed for Server-Side rendering issue on location
			if (typeof location == "object" && x.link == location.pathname)
				<MenuItem {...x} key={i} addClass="active" />
			else
				<MenuItem {...x} key={i} />

		<div className="horizontal-menu">
			<ul>
				{items}
			</ul>
		</div>
	})

exports.HorizontalMenu = HorizontalMenu

# Field
# -----------------------------------

InputSwitch = React.createClass({
	render: ->
		console.log props:@props, "input switch"
		<div className="form-field">
			<label className="checkbox-fancy">
				<input type="checkbox" checked={@props.value} />
				<div className="checkbox" />
			</label>
		</div>
	})

Field = React.createClass({
	render: ->
		label = @props.label || @props.name
		type = @props.type
		change = @props.change
		value = @props.value || null
		x = {
			name: @props.name
			label: label
			type: type
			onChange: change
			value: value
		}
		_i = null
		if type == "textarea"
			_i = React.createElement("textarea", x)
		else if type == "select"
			_i = React.createElement("select", x)
		else if type == "checkbox"
			# switch type
			_i = React.createElement(InputSwitch, x)
		else
			_i = React.createElement("input", x)

		<div className="form-field">
			<label htmlFor={@props.name}>{label}</label>
			<div className="field">
				{_i}
			</div>
		</div>
	})

exports.Field = Field

ButtonField = React.createClass({
	render: ->
		<div className="button-field">
			{@props.children}
		</div>
	})
exports.ButtonField = ButtonField

# Custom Segments
# ----------------------------------

PageContainer = React.createClass({
	render: ->
		cssClasses = ["page"]
		if @props.CSSClass
			cssClasses.push @props.CSSClass
		cssFinal = cssClasses.join(" ")

		<div className={cssFinal}>
			<ContentHeader {...@props.header} />
			{@props.children}
		</div>
	})

exports.PageContainer = PageContainer