React = require("react")
_ = require("lodash")
$ = require("jquery")
{Field, ButtonField} = require("../../components/form/form.cjsx")

{SUBMIT_CONTACT} = require("../../flux/actions/contact").actions

initial = {
	name: ""
	email: ""
	product: ""
	description: ""
	error:
		name: false
		email: false
		product: false
		description: false
	}

Captcha = React.createClass({
	render: ->
		styles = require("./contact.sass")
		<div className={styles["g-recaptcha"]} data-sitekey="6LcEyRwTAAAAAOhoaR6dCTQPOnLdSfcfIvRE-0n9" />
	})


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

ContactForm = React.createClass({
	getInitialState: ->
		return initial
	initial: ->
		return initial
	submit: (e)->
		self = this
		e.preventDefault()
		app.flux.dispatch({
			type: SUBMIT_CONTACT
			model: @state
			})
		.done(
			()->
				console.log "form submitted successfully!"
				self.setState(self.initial())
			(err)->
				self.setState({
					error: err
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
	render: ->
		items = @props.products.map (x, i)->
			<option key={i} value={x._id}>{x.category} - {x.product}</option>
		# add general question field
		items.unshift(
			<option key={items.length} value={""}>general question</option>
			)

		styles = require("./contact.sass")
		<form className={styles["contact-form"]} method="post" action="/api/post/contact" onSubmit={@submit}>
			<h2 className={styles["form-header"]}>send us a message</h2>
			<Field error={@state.error.name} name="name" value={@state.name} change={@change("name")} />
			<Field error={@state.error.email} name="email" label="email address" value={@state.email} change={@change("email")} />
			<Field type="custom">
				<SelectedProduct product={@state.product} list={@props.products} />
			</Field>
			<Field error={@state.error.product} type="custom" label="product">
				<select name="product" value={@state.product} onChange={@change("product")}>
					{items}
				</select>
			</Field>
			<Field error={@state.error.description} name="description" type="textarea" change={@change("description")} value={@state.description} />
			<Captcha />
			<ButtonField>
				<input type="submit" value="submit" />
			</ButtonField>
		</form>
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

module.exports = {
	LocationInfo
	ContactForm
}