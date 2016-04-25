React = require("react")
_ = require("lodash")
$ = require("jquery")
{Field, ButtonField} = require("../../components/form/form.cjsx")

Captcha = React.createClass({
	render: ->
		styles = require("./contact.sass")
		<div className={styles["g-recaptcha"]} data-sitekey="6LcEyRwTAAAAAOhoaR6dCTQPOnLdSfcfIvRE-0n9" />
	})


SelectedProduct = React.createClass({
	render: ->
		styles = require("./contact.sass")
		if !@props.product || @props.product == "none"
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
		if @props.selected then product = @props.selected._id
		return {
			name: ""
			email: ""
			product: product || ""
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
		# console.log props: @props, state: @state
		if @props.user
			name = @props.user.name || ""
			email = @props.user.email || ""
			@setState({
				name: name
				email: email
				})
	render: ->
		items = @props.products.map (x, i)->
			if !x.active
				return
			<option key={i} value={x._id}>{x.category} - {x.product}</option>
		# add general question field
		items.unshift(
			<option key={items.length} value={"none"}>general question</option>
			)

		styles = require("./contact.sass")
		<form className={styles["contact-form"]} method="post" action="/contact">
			{@props.children}
			<Field name="name" value={@state.name} change={@change("name")} />
			<Field name="email" label="email address" value={@state.email} change={@change("email_address")} />
			<Field type="custom">
				<SelectedProduct product={@state.product} list={@props.products} />
			</Field>
			<Field name="product" multiple={false} type="select" value={@state.product} change={@change("product")}>
				{items}
			</Field>
			<Field name="description" type="textarea" change={@change("description")} value={@state.description} />
			<Captcha />
			<ButtonField>
				<input type="submit" value="submit" onClick={@submit} />
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