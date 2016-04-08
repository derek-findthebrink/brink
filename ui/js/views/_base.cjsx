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
			<h2 className="page-header">{@props.title}</h2>
			<p className="page-header-description">{@props.description}</p>
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