React = require("react")
_ = require("lodash")
$ = require("jquery")


PageContainer = require("./modules/container-page")
{Field, ButtonField} = require("./modules/form")

Captcha = React.createClass({
	render: ->
		<div className="g-recaptcha" data-sitekey="6LcEyRwTAAAAAOhoaR6dCTQPOnLdSfcfIvRE-0n9" />
	})

ContactForm = React.createClass({
	getInitialState: ->
		return {
			name: ""
			email: ""
			product: ""
			description: ""
		}
	submit: (e)->
		# e.preventDefault()
		# console.log state:@state, props:@props
		# # add recaptcha here
		# # make sure to capture any other needed data (user? csrf? etc.)
		# app.flux.dispatch({
		# 	action: "submit_contact"
		# 	payload: @state
		# 	})
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
	componentWillMount: ->
		console.log props: @props, state: @state
		if @props.product
			if (@props.product.product && @props.product.category)
				product = @props.product.product
				category = @props.product.category
				@setState({
					product: category + "/" + product
					})
		if @props.user
			name = @props.user.name || ""
			email = @props.user.email || ""
			@setState({
				name: name
				email: email
				})
	render: ->
		# console.log props:@props
		<form className="contact-form" method="post" action="/contact">
			{@props.children}
			<Field name="name" value={@state.name} change={@change("name")} />
			<Field name="email" label="email address" value={@state.email} change={@change("email_address")} />
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
	getInitialState: ->
		return app.content.Contact
	render: ->
		# console.log props:@props
		<PageContainer {...@state}>
			<LocationInfo {...@state} />
			<ContactForm {...@state}>
				<h2 className="form-header">send us a message</h2>
			</ContactForm>
		</PageContainer>
	})

module.exports = Contact