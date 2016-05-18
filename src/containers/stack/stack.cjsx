React = require("react")
_ = require("lodash")
PageContainer = require("../../components/page/container-page.cjsx")
{asyncConnect} = require("redux-async-connect")

{RouterButton} = require("../../components/buttons/buttons.cjsx")

# Trade Image
# --------------------------------------------------------
TradeImage = React.createClass({
	render: ->
		styles = require("./stack.sass")
		# manage secondary trade image types
		if @props.secondary
			theClassName = styles.secondaryTradeImg
			overlay = (
				<div className={styles.overlay}>
					<h4 className={styles["overlay-text"]}>{@props.title}</h4>
				</div>
				)
		else
			theClassName = styles.mainTradeImg
			overlay = null

		# manage unset image src properties
		if (@props.src == "" || !@props.src)
			imgsrc = "/brink-logo-small.svg"
		else
			imgsrc = @props.src

		<div className={theClassName}>
			<a href={@props.href} target="_blank">
				<iron-image src={imgsrc} sizing="contain"></iron-image>
				{overlay}
			</a>
		</div>
	})


# Stack Items
# ------------------------------------------------------------
# Single Views
StackItemMain = React.createClass({
	render: ->
		styles = require("./stack.sass")
		<li className={styles.mainStack}>
			<TradeImage {...@props.img} title={@props.title} />
			<div className={styles.mainDescription}>
				<h3 className={styles.stackHeader}>{@props.title}</h3>
				<span className={styles.stackDescription}>{@props.description}</span>
			</div>
		</li>
	})

StackItemSecondary = React.createClass({
	render: ->
		<li>
			<TradeImage {...@props.img} title={@props.title} secondary={true} />
		</li>
	})



# Stack Export
# -------------------------------------------------------
Stack = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		styles = require("./stack.sass")
		content = @context.content["Stack"]
		stack = @props.stack.data
		_primary = _.filter stack, (x)->
			x.secondary == false
		_secondary = _.filter stack, (x)->
			x.secondary == true
		primary = _primary.map (x, i)->
			<StackItemMain key={i} {...x} />
		secondary = _secondary.map (x, i)->
			<StackItemSecondary key={i} {...x} />

		<PageContainer {...content}>
			<ul className={styles.listMain}>
				{primary}
			</ul>
			<ul className={styles.listSecondary}>
				{secondary}
			</ul>
			<div className={styles.stackCallout}>
				<h3>Looks good? Good. Now check out our products!</h3>
				<RouterButton href="/products-and-services" type="go" title="products" />
			</div>
		</PageContainer>
	})

StackAsyncFinal = asyncConnect({
	stack: (params, {store, get})->
		{dispatch, getState} = store
		isLoaded = (s)->
			state = s.reduxAsyncConnect
			return state.stack && state.stack.loaded
		if (!isLoaded(getState()))
			return get("stack")
	})(Stack)

module.exports = StackAsyncFinal