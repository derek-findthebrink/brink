React = require("react")

{Editor, EditorState} = require("draft-js")

DraftEditor = React.createClass({
	onChange: (editorState)->
		@setState({editorState})
	componentWillMount: ->
		@setState({
			editorState: EditorState.createEmpty()
			})
	render: ->
		console.log state:@state
		<div>
			<link href="/css/Draft.css" rel="stylesheet" />
			<Editor editorState={@state.editorState} onChange={@onChange} />
		</div>
	})

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

Currency = React.createClass({
	render: ->
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

Field = React.createClass({
	render: ->
		styles = require("./form.sass")
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
		if type == "textarea"
			_i = React.createElement("textarea", x)
		else if type == "currency"
			_i = React.createElement(Currency, x)
		else if type == "select"
			_i = React.createElement("select", x, @props.children)
		else if type == "number"
			_i = React.createElement(NumberInput, x)
		else if type == "rich"
			_i = React.createElement(DraftEditor, x)
		else if type == "checkbox"
			if @props.raw
				_i = React.createElement(RawInputSwitch, x, @props.children)
			else
				_i = React.createElement(InputSwitch, x)
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