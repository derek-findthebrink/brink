React = require("react")

Currency = React.createClass({
	render: ->
		console.log props:@props
		styles = require("./form.sass")
		val = @props.value.value

		<div className={styles.currency}>
			<NumberInput value={val} onChange={@props.onChange("price.value")} />
			<select value={@props.value.currency} onChange={@props.onChange("price.currency")}>
				<option value="CAD">CAD</option>
				<option value="USD">USD</option>
				<option value="MXN">MXN</option>
				<option value="EUR">EUR</option>
			</select>
			<select value={@props.value.priceType} onChange={@props.onChange("price.priceType")}>
				<option value="base price">base price</option>
				<option value="per hour">per hour</option>
				<option value="per month">per month</option>
				<option value="starting price">starting price</option>
			</select>
		</div>
	})

NumberInput = React.createClass({
	render: ->
		styles = require("./form.sass")
		<div className={styles.number}>
			<input {...@props} />
			<div>
				<iron-icon icon="icons:add" />
				<iron-icon icon="icons:remove" />
			</div>
		</div>
	})

module.exports = {
	Currency
	NumberInput
}