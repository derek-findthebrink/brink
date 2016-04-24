React = require("react")
{Link} = require("react-router")


ProductItem = React.createClass({
	render: ->
		styles = require("./product.sass")
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

module.exports = ProductItem