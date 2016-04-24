React = require("react")
{asyncConnect} = require("redux-async-connect")

PageContainer = require("../../components/page/container-page.cjsx")
PortfolioItem = require("./portfolio-item")

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