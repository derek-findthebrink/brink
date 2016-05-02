React = require("react")


InputSwitch = React.createClass({
	render: ->
		console.log props:@props, "input switch"
		styles = require("./form.sass")
		fancyCheckbox = require("./refills_switch.scss")
		checked = @props.value ? "checked" : null

		if @props.value
			_i = <input {...@props} checked />
		else
			_i = <input {...@props} />

		<div className={styles["form-field"]}>
			<label className={fancyCheckbox["checkbox-fancy"]}>
				{_i}
				<div className={fancyCheckbox.checkbox} />
			</label>
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

Field = React.createClass({
	render: ->
		styles = require("./form.sass")
		label = @props.label || @props.name
		type = @props.type
		change = @props.change
		value = @props.value
		x = {
			name: @props.name
			label: label
			type: type
			onChange: change
			value: value
		}
		if @props.multiple
			x.multiple = true

		_i = null
		if type == "textarea"
			_i = React.createElement("textarea", x)
		else if type == "select"
			_i = React.createElement("select", x, @props.children)
		else if type == "number"
			_i = React.createElement(NumberInput, x)
		else if type == "checkbox"
			_i = React.createElement(InputSwitch, x)
		else if type == "custom"
			_i = @props.children
		else
			_i = React.createElement("input", x)

		<div className={styles["form-field"]}>
			<label htmlFor={@props.name}>{label}</label>
			<div className={styles.field}>
				{_i}
			</div>
		</div>
	})


ButtonField = React.createClass({
	render: ->
		styles = require("./form.sass")
		<div className={styles["button-field"]}>
			{@props.children}
		</div>
	})




module.exports = {
	Field
	ButtonField
}