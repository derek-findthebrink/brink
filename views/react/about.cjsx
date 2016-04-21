React = require("react")

PageContainer = require("./modules/container-page.cjsx")


About = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		styles = require("./about.sass")
		about = @context.content["About"]
		<PageContainer {...about}>
			<div className={styles.container}>
				<div className={styles.row}>
					<div className={styles.img}>
						<img src="/brink-logo-small.svg" />
					</div>
					<div className={styles.description}>
						<h2 className={styles.name}>Derek</h2>
						<p className={styles.personDescription}>
							a cool guy who likes code!	
						</p>
					</div>
				</div>
			</div>
		</PageContainer>
	})

module.exports = About