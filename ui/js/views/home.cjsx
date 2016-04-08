React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")

{ContentHeader, HorizontalMenu, PageContainer} = require("./_base")

CarouselItem = React.createClass({
	render: ->
		style = {
			backgroundImage: "url(" + @props.img.src + ")"
			backgroundPosition: "cover"
			height: "7em"
		}
		<div style={style} className="item">
			<h3>{@props.title}</h3>
		</div>
	})

Carousel = React.createClass({
	componentDidMount: ->
		node = ReactDOM.findDOMNode(this)
		$(node).owlCarousel({
			loop: true
			margin: 10
			nav: true
			})
	render: ->
		items = @props.items.map (x, i)->
			<CarouselItem key={i} {...x} />

		<div className="owl-carousel owl-theme">
			{items}
		</div>
	})

BlogWidget = React.createClass({
	render: ->
		<div className="blog-widget">
			<p>I'm a blog-widget!</p>
			<p>goat turd</p>
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