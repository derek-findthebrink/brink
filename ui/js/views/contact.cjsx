React = require("react")
_ = require("lodash")
$ = require("jquery")

{ContentHeader, HorizontalMenu, PageContainer} = require("./_base")

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

Captcha = React.createClass({
	render: ->
		<div className="g-recaptcha" data-sitekey="6LcEyRwTAAAAAOhoaR6dCTQPOnLdSfcfIvRE-0n9" />
	})

ContactForm = React.createClass({
	render: ->
		<form className="contact-form" method="post" action="/contact">
			<Field name="name" />
			<Field name="email_address" label="email address" />
			<Field name="product" />
			<Field name="description" type="textarea" />
			<Captcha />
			<ButtonField>
				<input type="submit" value="submit" />
				<button type="back">back</button>
			</ButtonField>
		</form>
	})

LocationInfo = React.createClass({
	render: ->
		<div>
			<h2>Location</h2>
			<p>vancouver, bc</p>
			<p>canada</p>
			<p>604.762.6133</p>
		</div>
	})

# Contact
Contact = React.createClass({
	render: ->
		<PageContainer {...@props}>
			<ContactForm />
			<LocationInfo />
		</PageContainer>
	})

module.exports = Contact