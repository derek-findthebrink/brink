React = require("react")

PageContainer = require("./modules/container-page")
BlogWidget = require("./modules/widget-blog")
FeaturedProducts = require("./modules/widget-featured-products")
Story = require("./modules/story")

styles = require("pages/home.sass")

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
			<Story />
			<div className={styles.check}>
				<BlogWidget />
				<FeaturedProducts />
			</div>
		</PageContainer>
	})

module.exports = Home