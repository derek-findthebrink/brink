React = require("react")
_ = require("lodash")
CSSModules = require("react-css-modules")
PageContainer = require("./modules/container-page")

styles = require("pages/stack.sass")

console.log styles

# Trade Image
# --------------------------------------------------------
TradeImage = React.createClass({
	render: ->
		imgSrc = @props.src || "/brink-logo-small.svg"
		if imgSrc == ""
			imgSrc = "/brink-logo-small.svg"
		style = {
			backgroundImage: ["url(", imgSrc, ")"].join("")
		}
		overlay = null
		if @props.overlay

			overlay = (
				<div className={styles.overlay}>
					<h4 className={styles["overlay-text"]}>{@props.title}</h4>
				</div>
				)


		<div styleName="trade">
			<a href={@props.href} target="_blank">
				<div className={@props.addClass} style={style} />
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
			<TradeImage addClass={styles.mainTradeImg} {...@props.img} title={@props.title} />
			<div>
				<h3 className={styles.stackHeader}>{@props.title}</h3>
				<span className={styles.stackDescription}>{@props.description}</span>
			</div>
		</li>
	})

StackItemSecondary = React.createClass({
	render: ->
		<li>
			<TradeImage {...@props.img} addClass={styles.secondaryTradeImg} title={@props.title} overlay={true} />
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