React = require("react")
CSSModules = require("react-css-modules")
{Link} = require("react-router")

styles = require("modules/menu.sass")

MenuItem = React.createClass({
	render: ->
		classes = ["app-nav"]
		if @props.addClass
			classes.push(@props.addClass)
		c = classes.join(" ")
		<li className={@props.addClass || null}>
			<Link to={@props.link}>{@props.title}</Link>
		</li>
	})

HorizontalMenu = React.createClass({
	componentDidMount: ->
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

# _HorizontalMenu = CSSModules(HorizontalMenu, styles)

module.exports = {
	HorizontalMenu
}