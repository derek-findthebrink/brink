React = require("react")

PageContainer = require("../../components/page/container-page.cjsx")
BlogWidget = require("../../components/widgets/widget-blog.cjsx")
FeaturedProducts = require("../../components/widgets/widget-featured-products.cjsx")
Story = require("../../components/story/story.cjsx")


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
		</PageContainer>
	})

module.exports = Home