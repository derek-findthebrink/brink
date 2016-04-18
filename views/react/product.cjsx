React = require("react")
_ = require("lodash")
$ = require("jquery")

ReactCSSTransitionGroup = require("react-addons-css-transition-group")

styles = require("pages/product.sass")

PageContainer = require("modules/container-page.cjsx")
HorizontalMenu = require("modules/menu.cjsx").HorizontalMenu


# Single View
ProductItem = React.createClass({
	navigate: (e)->
		e.preventDefault()
		h = e.target.href
		app.flux.dispatch({
			action: "href_navigate"
			href: h
			})
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
				<h2 className={styles["product-header"]}>{@props.title}</h2>
				<p className={styles.summary}>{@props.description}</p>
				<div className="details">
					<p className={styles["includes-header"]}>includes:</p>
					<ul className={styles.includes}>
						{includes}
					</ul>
					<div className="pricing">
						<span className="price">starting at: $100</span>
						<span className="deal">for you: $50</span>
					</div>
				</div>
				<div className={styles["action-callout"]}>
					<a onClick={@navigate} href={_hrefLearn} className="learn">learn more</a>
					<a onClick={@navigate} href={_hrefContact} className="quote">quote</a>
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
				<ProductItem {...x} key={k++} />
		catch e
			items = <ProductItem title="no items available" />

		<PageContainer {...content}>
			<HorizontalMenu menu={content.menu} />
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