React = require("react")
{Link} = require("react-router")
{NavButton} = require("../buttons/buttons.cjsx")

SliderMenu = React.createClass({
	getInitialState: ->
		return {
			visible: false
		}
	render: ->
		if !@state.visible
			sliderState = {
				maxHeight: "0"
				# height: "0"
			}
		else
			sliderState = {
				maxHeight: "5em"
			}

		links = @props.links.map (x, i)->
			<li key={i}>
				<a href={x.href}>{x.title}</a>
			</li>

		styles = require("./header.sass")
		<div className={styles.sliderMenu} style={sliderState}>
			<ul>
				{links}
			</ul>
		</div>
	})

Header = React.createClass({
	navClick: ->
		console.log "nav button clicked"
		@refs.slider.setState (state)->
			visible: !state.visible
	render: ->
		links = @props.links.map (x, i)->
			<li key={i}>
				<Link to={x.to}>{x.title}</Link>
			</li>

		title = @props.title || "brink technology co."
		titleTo = @props.titleLink || "/"

		styles = require("./header.sass")
		if @props.admin
			containerClass = styles.admin
		else
			containerClass = styles.app
			# add admin styles/features here
		if @props.slider
			slider = (
				<div className={styles.sideMenu}>
					<NavButton type="theme" onClick={@navClick} />
					<SliderMenu ref="slider" links={@props.sliderLinks} />
				</div>
				)
		else
			slider = null

		<header className={containerClass}>
			<Link to={titleTo}>
				<img src="/brink-logo-small.svg" />
				<h1>{title}</h1>
			</Link>
			{slider}
			<nav className={styles.nav}>
				<ul>
					{links}
				</ul>
			</nav>
		</header>
	})

module.exports = Header