React = require("react")
_ = require("lodash")
$ = require("jquery")

ReactCSSTransitionGroup = require("react-addons-css-transition-group")

{ContentHeader, HorizontalMenu, PageContainer} = require("./_base")

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

		<li className="product-item">
			<div className="img">
				<img src="/brink-logo-small.svg" alt="brink logo" />
			</div>
			<div className="description">
				<h2 className="product-header">{@props.title}</h2>
				<p className="summary">{@props.description}</p>
				<div className="details">
					<p className="includes-header">includes:</p>
					<ul className="includes">
						{includes}
					</ul>
					<div className="pricing">
						<span className="price">starting at: $100</span>
						<span className="deal">for you: $50</span>
					</div>
				</div>
				<div className="action-callout">
					<a onClick={@navigate} href={_hrefLearn} className="learn">learn more</a>
					<a onClick={@navigate} href={_hrefContact} className="quote">quote</a>
				</div>
			</div>
		</li>
	})


# Products
k = 0
Products = React.createClass({
	render: ->
		try
			items = @props.list.map (x, i)->
				<ProductItem {...x} key={k++} />
		catch e
			items = <ProductItem title="no items available" />
		speed = 750

		<PageContainer {...@props}>
			<HorizontalMenu menu={@props.menu} />
			<ul className="products-list">
				<ReactCSSTransitionGroup 
				transitionName="product-transition" 
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