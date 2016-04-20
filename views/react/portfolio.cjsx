React = require("react")
_ = require("lodash")
$ = require("jquery")

PageContainer = require("./modules/container-page")

styles = require("pages/portfolio.sass")

Portfolio = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		content = @context.content["Portfolio"]
		<PageContainer {...content}>
			<div className={styles.container}>
				<div className={styles.row}>
					<h2>Cleanify</h2>
				</div>
				<div className={styles.row}>
					<h2>Pyrrha</h2>
				</div>
				<div className={styles.row}>
					<h2>One Ocean</h2>
				</div>
			</div>
		</PageContainer>
	})

module.exports = Portfolio