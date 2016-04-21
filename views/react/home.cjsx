React = require("react")

PageContainer = require("./modules/container-page.cjsx")
BlogWidget = require("./modules/widget-blog.cjsx")
FeaturedProducts = require("./modules/widget-featured-products.cjsx")
Story = require("./modules/story.cjsx")


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
		styles = require("./home.sass")
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