React = require("react")
{asyncConnect} = require("redux-async-connect")
Helmet = require("react-helmet")

PageContainer = require("../../components/page/container-page.cjsx")


# Single View
# ------------------------------------------------
PortfolioItem = React.createClass({
	render: ->
		styles = require("./portfolio.sass")

		_meta = [
			{
				name: "description"
				content: "Here's what we've done so far. Look good? Good stuff. We would love to do the same for you."
			}
		]

		includes = @props.includes.map (x, i)->
			<li key={i}>{x}</li>

		icons = @props.includesImg.map (x, i)->
			<img key={i} src={x.img} />

		<div className={styles.row}>
			<Helmet title="Portfolio" meta={_meta} />
			<div className={styles.img}>
				<iron-image src={@props.img} sizing="cover" />
				<div className={styles.imgOverlay} />
			</div>
			<div className={styles.header}>
				<div className={styles.headerInner}>
					<h2>{@props.title}</h2>
					<div className={styles.icons}>
						{icons}
					</div>
				</div>
				<div className={styles.dataContainer}>
					<table className={styles.data}>
						<tbody>
							<tr>
								<th>type</th>
								<td>{@props.type}</td>
							</tr>
							<tr>
								<th>commissioner</th>
								<td>{@props.commissioner}</td>
							</tr>
							<tr>
								<th>status</th>
								<td>{@props.status}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<hr className={styles.hr} />
			<div className={styles.description}>
				<p>{@props.description}</p>
				<ul>
					{includes}
				</ul>
			</div>
		</div>
	})



# Container
# --------------------------------------------

Portfolio = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		styles = require("./portfolio.sass")
		content = @context.content["Portfolio"]
		pitems = @props.portfolio.data

		items = pitems.map (x, i)->
			<PortfolioItem {...x} key={i} />

		<PageContainer {...content}>
			<div className={styles.container}>
				{items}
			</div>
		</PageContainer>
	})

PortfolioAsyncFinal = asyncConnect({
	portfolio: (params, {store, get})->
		{dispatch, getState} = store
		isLoaded = (s)->
			state = s.reduxAsyncConnect
			return state.portfolio && state.portfolio.loaded
		if (!isLoaded(getState()))
			return get("portfolio")
	})(Portfolio)

module.exports = PortfolioAsyncFinal