React = require("react")
_ = require("lodash")
$ = require("jquery")
{Link} = require("react-router")

ReactCSSTransitionGroup = require("react-addons-css-transition-group")

styles = require("pages/product.sass")

PageContainer = require("modules/container-page.cjsx")
HorizontalMenu = require("modules/menu.cjsx").HorizontalMenu


# Single View
ProductItem = React.createClass({
	render: ->
		_hrefLearn = ["/products-and-services", @props.category, @props.product].join("/")
		_hrefContact = ["/contact", @props.category, @props.product].join("/")
		includes = null
		if @props.includes
			includes = @props.includes.map (x, i)->
				<li key={i}>{x}</li>
		else
			includes = <li>no includes provided</li>

		<li className={styles["product-item"]}>
			<div className={styles.img}>
				<img src="/brink-logo-small.svg" alt="brink logo" />
			</div>
			
			<div className={styles.description}>
				<div className={styles.header}>
					<h2>{@props.title}</h2>
					<p>{@props.description}</p>
				</div>
				
				<div className={styles.details}>
					<div className={styles.includes}>
						<p>includes:</p>
						<ul>
							{includes}
						</ul>
					</div>
					<div className={styles.pricing}>
						<h2>{@props.price} <span className={styles.currency}>CAD</span></h2>
						<p>{@props.priceType}</p>
					</div>
				</div>
				
				<div className={styles["action-callout"]}>
					<Link to={_hrefLearn} className={styles.learn}>learn more</Link>
					<Link to={_hrefContact} className={styles.quote}>quote</Link>
				</div>
			</div>

		</li>
	})


# Products
k = 0
Products = React.createClass({
	contextTypes:
		content: React.PropTypes.object
	render: ->
		speed = 750
		content = @context.content["Products"]
		# console.log products:content
		# console.log props:@props
		section = @props.params.section

		# if section, then filter out items to match category
		if section
			base = _.filter(content.list, (x)->
				x.category == section
				)
			# console.log base:base
		else
			base = content.list
		# else show all items
		try
			items = base.map (x, i)->
				if x.active == false
					return
				<ProductItem {...x} key={k++} />
		catch e
			items = <ProductItem title="no items available" />

		<PageContainer {...content}>
			<HorizontalMenu menu={content.menu} location={@props.location} />
			<ul className={styles["products-list"]}>
				<ReactCSSTransitionGroup 
				transitionName={{
					enter: styles["product-trans-enter"]
					leave: styles["product-trans-leave"]
					appear: styles["product-trans-enter"]
					}}
				transitionAppear={true} 
				transitionAppearTimeout={speed} 
				transitionEnterTimeout={speed} 
				transitionLeave={false}
				transitionLeaveTimeout={speed}>
					{items}
				</ReactCSSTransitionGroup>
			</ul>
		</PageContainer>		
	})

module.exports = Products