React = require("react")
CSSModules = require("react-css-modules")

styles = require("modules/menu.sass")

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

		<div className={styles.horizontal}>
			<ul>
				{items}
			</ul>
		</div>
	})

_HorizontalMenu = CSSModules(HorizontalMenu, styles)

module.exports = {
	_HorizontalMenu
}