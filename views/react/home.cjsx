React = require("react")

PageContainer = require("./modules/container-page")
BlogWidget = require("./modules/widget-blog")
FeaturedProducts = require("./modules/widget-featured-products")

try
	log = appLogger.child({
		type: "views"
		file: "react/home"
	})
catch
	log = console
	log.info = console.log




Home = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		# console.log @context.content
		home = @context.content["Home"]
		<PageContainer {...home}>
			<BlogWidget />
			<FeaturedProducts />
		</PageContainer>
	})

module.exports = Home