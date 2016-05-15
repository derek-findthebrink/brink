React = require("react")

{InputSwitch, RawInputSwitch} = require("./checkbox.cjsx")
{DraftEditor} = require("./rich-text.cjsx")
{Currency, NumberInput} = require("./number.cjsx")


Field = React.createClass({
	render: ->
		styles = require("./form.sass")
		console.log props:@props
		label = @props.label || @props.name
		type = @props.type
		change = @props.change
		value = @props.value
		error = @props.error
		x = {
			name: @props.name
			label: label
			onChange: change
			value: value
			type: type
		}
		_i = null
		if type == "currency"
			_i = React.createElement(Currency, x)
		else if type == "number"
			_i = React.createElement(NumberInput, x)
		else if type == "rich"
			_i = React.createElement(DraftEditor, x)
		else if type == "checkbox"
			if @props.raw
				_i = React.createElement(RawInputSwitch, x, @props.children)
			else
				_i = React.createElement(InputSwitch, x)
		else if type == "textarea"
			_i = React.createElement("textarea", x)
		else if type == "select"
			_i = React.createElement("select", x, @props.children)
		else if type == "custom"
			_i = @props.children
		else
			_i = React.createElement("input", x)

		if error
			fieldClass = styles["fieldError"]
			errorMsg = error
		else
			fieldClass = styles["form-field"]
			errorMsg = null

		<div className={fieldClass}>
			<label htmlFor={@props.name}>{label}</label>
			<div className={styles.field}>
				{_i}
				<div className={styles.error}>
					<span>{errorMsg}</span>
				</div>
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