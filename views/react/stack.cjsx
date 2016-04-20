React = require("react")
_ = require("lodash")
CSSModules = require("react-css-modules")
PageContainer = require("./modules/container-page")

styles = require("pages/stack.sass")

# Trade Image
# --------------------------------------------------------
TradeImage = React.createClass({
	render: ->
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
		<li>
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
		content = @context.content["Stack"]
		_primary = _.filter content.list, (x)->
			x.secondary == false
		_secondary = _.filter content.list, (x)->
			x.secondary == true
		primary = _primary.map (x, i)->
			<StackItemMain key={i} {...x} />
		secondary = _secondary.map (x, i)->
			<StackItemSecondary key={i} {...x} />
			


		<PageContainer {...content}>
			<ul styleName="listMain">
				{primary}
			</ul>
			<ul styleName="listSecondary">
				{secondary}
			</ul>
		</PageContainer>
	})

module.exports = CSSModules(Stack, styles)