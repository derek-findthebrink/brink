React = require("react")


InputSwitch = React.createClass({
	render: ->
		console.log props:@props, "input switch"
		<div className="form-field">
			<label className="checkbox-fancy">
				<input type="checkbox" checked={@props.value} />
				<div className="checkbox" />
			</label>
		</div>
	})

Field = React.createClass({
	render: ->
		styles = require("./form.sass")
		label = @props.label || @props.name
		type = @props.type
		change = @props.change
		value = @props.value || null
		x = {
			name: @props.name
			label: label
			type: type
			onChange: change
			value: value
		}
		_i = null
		if type == "textarea"
			_i = React.createElement("textarea", x)
		else if type == "select"
			_i = React.createElement("select", x)
		else if type == "checkbox"
			# switch type
			_i = React.createElement(InputSwitch, x)
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