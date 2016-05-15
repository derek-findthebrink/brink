React = require("react")

InputSwitch = React.createClass({
	render: ->
		styles = require("./form.sass")
		fancyCheckbox = require("./refills_switch.scss")

		_i = <input {...@props} />

		<div className={styles["form-field"]}>
			<label className={fancyCheckbox["checkbox-fancy"]}>
				{_i}
				<div className={fancyCheckbox.checkbox} />
			</label>
		</div>
	})

RawInputSwitch = React.createClass({
	render: ->
		styles = require("./form.sass")
		fancyCheckbox = require("./refills_switch.scss")
		_i = <input type="checkbox" value={@props.value} name={@props.name} onChange={@props.onChange} />
		<div className={styles["form-field"]}>
			<label className={fancyCheckbox["checkbox-fancy"]}>
				{_i}
				<div className={fancyCheckbox.checkbox} />
			</label>
			{@props.children}
		</div>
	})

module.exports = {
	InputSwitch
	RawInputSwitch
}