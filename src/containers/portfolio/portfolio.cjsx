React = require("react")

PageContainer = require("../../components/page/container-page.cjsx")
PortfolioItem = require("./portfolio-item")

Portfolio = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		styles = require("./portfolio.sass")
		content = @context.content["Portfolio"]

		items = content.list.map (x, i)->
			<PortfolioItem {...x} key={i} />

		<PageContainer {...content}>
			<div className={styles.container}>
				{items}
			</div>
		</PageContainer>
	})

module.exports = Portfolio