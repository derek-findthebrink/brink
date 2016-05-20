React = require("react")
Helmet = require("react-helmet")

PageContainer = require("../../components/page/container-page.cjsx")
{asyncConnect} = require("redux-async-connect")


About = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		styles = require("./about.sass")
		header = @context.content["About"]

		about = @props.about.data

		items = about.map (x, i)->
			<PersonItem {...x} key={i} />

		<PageContainer {...header}>
			<Helmet title="About" />
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
				<h4>Principal Designer</h4>
				<p className={styles.personDescription}>
					{@props.description}
				</p>
			</div>
		</div>
	})

AboutAsyncFinal = asyncConnect({
	about: (params, {store, get})->
		{dispatch, getState} = store
		isLoaded = (s)->
			state = s.reduxAsyncConnect
			return state.about && state.about.loaded
		if (!isLoaded(getState()))
			return get("about")
	})(About)

module.exports = AboutAsyncFinal