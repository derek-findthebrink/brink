React = require("react")

PageContainer = require("modules/container-page.cjsx")

About = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		about = @context.content["About"]
		<PageContainer {...about}>
			<p>about content here</p>
		</PageContainer>
	})

module.exports = About