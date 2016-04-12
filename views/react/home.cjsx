React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")

PageContainer = require("./modules/container-page")
BlogWidget = require("./modules/widget-blog")
FeaturedProducts = require("./modules/widget-featured-products")


Home = React.createClass({
	render: ->
		# <Carousel items={@props.carousel} />
		<PageContainer {...@props}>
			<BlogWidget />
			<FeaturedProducts />
		</PageContainer>
	})

module.exports = Home