React = require("react")
{asyncConnect} = require("redux-async-connect")

PageContainer = require("../../components/page/container-page.cjsx")


# Single View
# ------------------------------------------------
PortfolioItem = React.createClass({
	render: ->
		styles = require("./portfolio.sass")

		<div className={styles.row}>
			<div className={styles.img}>
				<iron-image src="/img/oo-arctic-07.jpg" sizing="cover" />
				<div className={styles.imgOverlay} />
			</div>
			<div className={styles.header}>
				<div className={styles.headerInner}>
					<h2>{@props.title}</h2>
					<div className={styles.icons}>
						<img src="/icons/brink-icons_uptime.svg" />
						<img src="/icons/brink-icons_uptime.svg" />
						<img src="/icons/brink-icons_uptime.svg" />
					</div>
				</div>
				<table className={styles.data}>
					<tbody>
						<tr>
							<th>type</th>
							<td>front-end development</td>
						</tr>
						<tr>
							<th>commissioner</th>
							<td>Cleanify Inc.</td>
						</tr>
						<tr>
							<th>status</th>
							<td>live</td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr className={styles.hr} />
			<div className={styles.description}>
				<p>We did some really great things with this company</p>
				<ul>
					<li>site maintenance</li>
					<li>conforming design to brand</li>
					<li>increasing server performance</li>
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