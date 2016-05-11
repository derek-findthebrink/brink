React = require("react")
{Link} = require("react-router")

{RouterButton} = require("../../components/buttons/buttons.cjsx")


ProductItem = React.createClass({
	render: ->
		styles = require("./product.sass")
		_hrefLearn = ["/learn", @props._id].join("/")
		_hrefContact = "/contact?product=" + @props._id
		# console.log {@props}
		includes = null
		if @props.includes
			includes = @props.includes.map (x, i)->
				<li key={i}>{x}</li>
		else
			includes = <li>no includes provided</li>

		<li className={styles["product-item"]}>
			<div className={styles.img}>
				<img src={@props.img} alt={@props.title} />
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
						<h2>
							<span className={styles.currency}>$</span>
							{@props.price.value}
							<span className={styles.currency}> {@props.price.currency}<span className={styles.addTax}> +tax</span></span>
						</h2>
						<p>{@props.price.priceType}</p>
					</div>
				</div>
				
				<div className={styles["action-callout"]}>
					<RouterButton title="learn more" href={_hrefLearn} type="info">learn more</RouterButton>
					<RouterButton title="quote" href={_hrefContact} type="go">quote</RouterButton>
				</div>
			</div>

		</li>
	})

module.exports = ProductItem