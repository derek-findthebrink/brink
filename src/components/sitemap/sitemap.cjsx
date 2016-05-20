React = require("react")
_ = require("lodash")
{Link} = require("react-router")



MapItem = React.createClass({
	render: ->
		if @props.pages
			pages = _.map @props.pages, (val, key)->
				<SubMapItem {...val} title={key} key={key} />
		else
			pages = null
		if !@props.link
			link = <h3>{@props.title}</h3>
		else
			link = <h3><Link to={@props.link}>{@props.title}</Link></h3>
		<li>
			{link}
			<ul>
				{pages}
			</ul>
		</li>
	})

SubMapItem = React.createClass({
	render: ->
		<li>
			<h4><Link to={@props.link}>{@props.title}</Link></h4>
		</li>
	})

TopMap = React.createClass({
	render: ->
		pages = _.map @props.pages, (val, key, obj)->
			<MapItem {...val} key={key} />
		<ul>
			{pages}
		</ul>
	})

Sitemap = React.createClass({
	render: ->
		pages = {
			home:
				title: "Home"
				link: "/"
			products:
				title: "Products"
				link: "/products-and-services"
				pages:
					packages:
						link: "/products-and-services/packages"
					websites:
						link: "/products-and-services/websites"
					email:
						link: "/products-and-services/email"
					graphics:
						link: "/products-and-services/graphics"
					apps:
						link: "/products-and-services/apps"
			learn:
				title: "Learn"
				pages:
					startupPackage:
						link: "/learn/herp"
			portfolio:
				title: "Portfolio"
				link: "/portfolio"
			about:
				title: "About"
				link: "/about"
			stack:
				title: "Stack"
				link: "/stack"
			contact:
				title: "Contact"
				link: "/contact"
		}
		styles = require("./sitemap.sass")
		<div className={styles.container}>
			<h2>Site Map</h2>
			<div className={styles.map}>
				<TopMap pages={pages} />
			</div>
		</div>
	})

module.exports = Sitemap