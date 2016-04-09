React = require("react")
_ = require("lodash")
$ = require("jquery")

{ContentHeader, HorizontalMenu, PageContainer} = require("./_base")

Field = React.createClass({
	render: ->
		label = @props.label || @props.name
		type = @props.type
		change = @props.change
		x = {
			name: @props.name
			label: label
			type: type
			onChange: change
		}
		_i = null
		if type == "textarea"
			_i = React.createElement("textarea", x)
		else if type == "select"
			_i = React.createElement("select", x)
		else
			_i = React.createElement("input", x)

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
	getInitialState: ->
		return {
			name: ""
			email_address: ""
			product: ""
			description: ""
		}
	submit: (e)->
		e.preventDefault()
		console.log state:@state, props:@props
		# add recaptcha here
		# make sure to capture any other needed data (user? csrf? etc.)
		app.flux.dispatch({
			action: "submit_contact"
			payload: @state
			})
	back: ->
		console.log "back clicked"
	change: (key)->
		# console.log key:key
		return (e)=>
			val = e.target.value
			# console.log val:val, "change ran"
			@setState(->
				x = {}
				x[key] = val
				return x
				)
	render: ->
		# console.log props:@props
		<form className="contact-form" method="post" action="/contact">
			{@props.children}
			<Field name="name" value={@state.name} change={@change("name")} />
			<Field name="email_address" label="email address" value={@state.email_address} change={@change("email_address")} />
			<Field name="product" value={@state.product} change={@change("product")} />
			<Field name="description" type="textarea" change={@change("description")} value={@state.description} />
			<Captcha />
			<ButtonField>
				<input type="submit" value="submit" onClick={@submit} />
				<button type="back" onClick={@back}>back</button>
			</ButtonField>
		</form>
	})

LocationRow = React.createClass({
	render: ->
		info = @props.value
		header = @props.header
		if header == "phone"
			info = "604.762.6133"
		<div className="location-row">
			<span className="location-header">{header}</span>
			<span className="location-info">{info}</span>
		</div>
	})

LocationInfo = React.createClass({
	render: ->
		c = 0
		items = _.map @props.location, (x, i)->
			<LocationRow header={i} value={x} key={c++} />

		<div className="location">
			{items}
		</div>
	})

# Contact
Contact = React.createClass({
	render: ->
		# console.log props:@props
		<PageContainer {...@props}>
			<LocationInfo {...@props} />
			<ContactForm {...@props}>
				<h2 className="form-header">send us a message</h2>
			</ContactForm>
		</PageContainer>
	})

module.exports = Contact