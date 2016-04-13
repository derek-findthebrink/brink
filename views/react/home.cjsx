React = require("react")
ReactDOM = require("react-dom")
_ = require("lodash")

PageContainer = require("./modules/container-page")
BlogWidget = require("./modules/widget-blog")
FeaturedProducts = require("./modules/widget-featured-products")

Home = React.createClass({
	getInitialState: ->
		return app.content.Home
	render: ->
		console.log state:@state
		<PageContainer {...@state}>
			<BlogWidget />
			<FeaturedProducts />
		</PageContainer>
	})

module.exports = Home