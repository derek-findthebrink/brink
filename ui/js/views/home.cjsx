React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")

{ContentHeader, HorizontalMenu, PageContainer} = require("./_base")

CarouselItem = React.createClass({
	render: ->
		href = @props.href || "#"
		classes = []
		classes.push(@props.animationClass)
		_cl = classes.join(" ")

		<li id={@props.slideId} className={_cl}>
			<a href={href}>
				<img {...@props.img} />
			</a>
			<div className="tooltip">
				<h1>{@props.title}</h1>
				<p>{@props.description}</p>
			</div>
		</li>
	})

Carousel = React.createClass({
	componentDidMount: ->
		return
	render: ->
		carouselKeys = ["alpha", "beta", "gamma", "theta", "delta"]
		items = @props.items.map (x, i)->
			i++
			y = {}
			y.slideId = carouselKeys[i]
			y.animationClass = ["anim-slider-", i].join("")
			<CarouselItem key={i} {...x} {...y} />

		<div className="carousel">
			<div id="content-slider">
				<div id="slider">
					<div id="mask">
						<ul>
							{items}
						</ul>
					</div>
					<div className="progress-bar" />
				</div>
			</div>
		</div>
	})

BlogWidget = React.createClass({
	render: ->
		<div className="blog-widget">
			<p>I'm a blog-widget!</p>
		</div>
	})

FeaturedProducts = React.createClass({
	render: ->
		<div className="featured-products">
			<p>some featured products!</p>
		</div>
	})


Home = React.createClass({
	render: ->
		<PageContainer {...@props}>
			<Carousel items={@props.carousel} />
			<BlogWidget />
			<FeaturedProducts />
		</PageContainer>
	})

module.exports = Home