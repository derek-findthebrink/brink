React = require("react")
_ = require("lodash")
$ = require("jquery")
{Field, ButtonField} = require("../../components/form/form.cjsx")

{SUBMIT_CONTACT} = require("../../actions/types/contact").actions
{NOTIFY_SUCCESS, NOTIFY_ERROR} = require("../../actions/types/notifications").actions

ReCaptcha = require("react-google-recaptcha")
recaptchaKey = "6LcEyRwTAAAAAOhoaR6dCTQPOnLdSfcfIvRE-0n9"



SelectedProduct = React.createClass({
	render: ->
		styles = require("./contact.sass")
		if !@props.product || @props.product == ""
			return null
		else
			productId = @props.product
			actual = _.find @props.list, (x)->
				return productId == x._id

			<div className={styles.selectedProduct}>
				<h3>{actual.category} - {actual.title}</h3>
				<p>{actual.description}</p>
				<p>${actual.price.value} {actual.price.currency} / {actual.price.priceType}</p>
			</div>
	})

LocationRow = React.createClass({
	render: ->
		styles = require("./contact.sass")
		info = @props.value
		header = @props.header
		if header == "phone"
			info = "604.762.6133"
		<div className={styles["location-row"]}>
			<span className="location-header">{header}</span>
			<span className={styles["location-info"]}>{info}</span>
		</div>
	})


LocationInfo = React.createClass({
	render: ->
		styles = require("./contact.sass")
		items = _.map @props.location, (x, i)->
			<LocationRow header={i} value={x} key={i} />

		<div className={styles.location}>
			{items}
		</div>
	})

_contact = {
	name:
		type: "text"
		name: "name"
	email:
		type: "text"
		name: "email"
	phone:
		type: "text"
		name: "phone"
	product:
		type: "custom"
	description:
		type: "textarea"
		name: "description"
		label: "message"
	shouldCall:
		type: "checkbox"
		name: "shouldCall"
		label: ""
		raw: true
	recaptcha:
		type: "custom"
		name: "recaptcha"
	}

initial = {
	name: ""
	email: ""
	phone: ""
	product: ""
	description: ""
	shouldCall: null
	recaptcha: false
	error:
		name: false
		email: false
		product: false
		description: false
		recaptcha: false
}

ContactForm = React.createClass({
	getInitialState: ->
		return initial
	reset: ->
		@setState(initial, =>
			@refs.recaptcha.reset()
			)
	validationError: (details)->
		app.flux.dispatch({
			type: NOTIFY_ERROR
			msg: "Sorry, we couldn't send that. Please check the form for more information."
			})
		@setState({
			error: details.err
			})
	submit: (e)->
		self = this
		e.preventDefault()
		console.log state:@state, "pre-send state"

		app.flux.dispatch({
			type: SUBMIT_CONTACT
			model: @state
			})
		.done(
			()->
				self.reset()
				app.flux.dispatch({
					type: NOTIFY_SUCCESS
					msg: "Success! We will get back to you shortly."
					})
			(err)->
				if err.type == "validation"
					self.validationError(err)
				else
					console.error err
					app.flux.dispatch({
						type: NOTIFY_UNHANDLED
						})
					self.setState({
						error: initial.error
						})
			)
	componentWillMount: ->
		if @props.selected
			selected = @props.selected
			@setState({
				product: selected
				})
	change: (key)->
		return (e)=>
			val = e.target.value
			@setState(->
				x = {}
				x[key] = val
				return x
				)
	checkbox: (key)->
		return =>
			prev = @state[key]
			if prev
				next = null
			else
				next = "on"
			@setState(->
				x = {}
				x[key] = next
				return x
				)
	captcha: (val)->
		@setState({
			recaptcha: val
			})
	render: ->
		console.log state:@state, "form state"
		items = @props.products.map (x, i)->
			<option key={i} value={x._id}>{x.category} - {x.product}</option>
		# add general question field
		items.unshift(
			<option key={items.length} value={""}>general question</option>
			)

		styles = require("./contact.sass")
		<form className={styles["contact-form"]} method="post" action="/api/post/contact" onSubmit={@submit}>
			<h2 className={styles["form-header"]}>send us a message</h2>
			<Field settings={_contact.name} model={@state} change={@change} />
			<Field settings={_contact.email} model={@state} change={@change} />
			<Field settings={_contact.phone} model={@state} change={@change} />
			<Field type="custom">
				<SelectedProduct product={@state.product} list={@props.products} />
			</Field>
			<Field error={@state.error.product} type="custom" label="product">
				<select name="product" value={@state.product} onChange={@change("product")}>
					{items}
				</select>
			</Field>
			<Field settings={_contact.description} model={@state} change={@change} />
			<Field settings={_contact.shouldCall} model={@state} change={@checkbox}>
				<p>would you like someone to call you?</p>
			</Field>
			<Field error={@state.error.recaptcha} type="custom">
				<ReCaptcha className={styles["g-recaptcha"]} ref="recaptcha" sitekey={recaptchaKey} onChange={@captcha} />
			</Field>
			<ButtonField>
				<input type="submit" value="submit" />
			</ButtonField>
		</form>
	})


module.exports = {
	LocationInfo
	ContactForm
}