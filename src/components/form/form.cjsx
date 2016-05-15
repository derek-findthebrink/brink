React = require("react")
_ = require("lodash")

{InputSwitch, RawInputSwitch} = require("./checkbox.cjsx")
{DraftEditor} = require("./rich-text.cjsx")
{Currency, NumberInput} = require("./number.cjsx")
{Input, Textarea} = require("./text.cjsx")

propTypes = React.PropTypes

Field = React.createClass({
	render: ->
		styles = require("./form.sass")

		if @props.type == "custom"
			type = "custom"
			label = @props.label || ""
			error = @props.error
		else
			settings = @props.settings
			model = @props.model
			_change = @props.change

			label = settings.label || settings.name
			type = settings.type
			fieldName = settings.name

			if settings.keyLocation
				change = _change(settings.keyLocation)
				value = _.get model, settings.keyLocation
				error = _.get model.error, settings.keyLocation
			else
				change = _change(fieldName)
				value = _.get model, fieldName
				error = _.get model.error, fieldName
			
			x = {
				name: fieldName
				# label: label
				onChange: change
				value: value
				type: type
			}

		_i = null
		if type == "currency"
			x.onChange = _change
			_i = React.createElement(Currency, x)
		else if type == "number"
			_i = React.createElement(NumberInput, x)
		else if type == "rich"
			_i = React.createElement(DraftEditor, x)
		else if type == "checkbox"
			if settings.raw
				_i = React.createElement(RawInputSwitch, x, @props.children)
			else
				_i = React.createElement(InputSwitch, x)
		else if type == "textarea"
			_i = React.createElement(Textarea, x)
		else if type == "select"
			_i = React.createElement("select", x, @props.children)
		else if type == "custom"
			_i = @props.children
		else
			_i = React.createElement(Input, x)

		if error
			fieldClass = styles["fieldError"]
			errorMsg = error
		else
			fieldClass = styles["form-field"]
			errorMsg = null

		<div className={fieldClass}>
			<label htmlFor={fieldName}>{label}</label>
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