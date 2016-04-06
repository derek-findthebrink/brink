React = require("react")
_ = require("lodash")
$ = require("jquery")

{ContentHeader, HorizontalMenu} = require("./_base")

Field = React.createClass({
	render: ->
		label = @props.label || @props.name
		type = @props.type
		_i = null
		if type == "textarea"
			_i = React.createElement("textarea", @props)
		else if type == "select"
			_i = React.createElement("select", @props)
		else
			_i = React.createElement("input", @props)

		<div className="form-field">
			<label htmlFor={@props.name}>{label}</label>
			<div className="field">
				{_i}
			</div>
		</div>
	})

ButtonField = React.createClass({
	render: ->
		<div className="button-field">
			{@props.children}
		</div>
	})

# Contact
Contact = React.createClass({
	render: ->
		<div className="contact">
			<ContentHeader {...@props.header} />
			<form className="contact-form">
				<Field name="name" />
				<Field name="email_address" label="email address" />
				<Field name="product" />
				<Field name="description" type="textarea" />
				<ButtonField>
					<input type="submit" value="submit" />
					<button type="back">back</button>
				</ButtonField>
			</form>
		</div>
	})

module.exports = Contact