React = require("react")
_ = require("lodash")
$ = require("jquery")

PageContainer = require("./modules/container-page")

Portfolio = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		content = @context.content["Portfolio"]
		<PageContainer {...content}>
			<p>portfolio content here</p>
		</PageContainer>
	})

module.exports = Portfolio