React = require("react")


InputSwitch = React.createClass({
	render: ->
		# console.log props:@props, "input switch"
		styles = require("./form.sass")
		fancyCheckbox = require("./refills_switch.scss")
		<div className={styles["form-field"]}>
			<label className={fancyCheckbox["checkbox-fancy"]}>
				<input {...@props} />
				<div className={fancyCheckbox.checkbox} />
			</label>
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
		else if type == "checkbox"
			# switch type
			if value
				x.checked = "checked"
			else if value == "false"
				delete x.checked
			else
				delete x.checked
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