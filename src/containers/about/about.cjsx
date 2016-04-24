React = require("react")

PageContainer = require("../../components/page/container-page.cjsx")


About = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		styles = require("./about.sass")
		about = @context.content["About"]

		items = about.list.map (x, i)->
			<PersonItem {...x} key={i} />

		<PageContainer {...about}>
			<div className={styles.container}>
				{items}
			</div>
		</PageContainer>
	})


PersonItem = React.createClass({
	render: ->
		styles = require("./about.sass")

		<div className={styles.row}>
			<div className={styles.img}>
				<img src={@props.image} />
			</div>
			<div className={styles.description}>
				<h2 className={styles.name}>{@props.name}</h2>
				<p className={styles.personDescription}>
					{@props.description}
				</p>
			</div>
		</div>
	})

module.exports = About