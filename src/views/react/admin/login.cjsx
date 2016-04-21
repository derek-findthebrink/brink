React = require("react")
_ = require("lodash")

{Field, ButtonField} = require("../modules/form.cjsx")


Login = React.createClass({
	getInitialState: ->
		return {
			email: ""
			username: ""
			password: ""
		}
	change: (key)->
		return (e)=>
			val = e.target.value
			@setState(->
				x = {}
				x[key] = val
				return x
				)
	# not in use
	submit: ->
		state = @props.state

	render: ->
		if @props.title == "register"
			username = <Field name="username" type="text" value={@state.username} change={@change("username")} />
		<form action={@props.action} method="post">
			<h2>{@props.title}</h2>
			<Field name="email" value={@state.email} change={@change("email")} />
			<Field name="password" type="password" value={@state.password} change={@change("password")} />
			{username || null}
			<input type="submit" value="Submit" />
		</form>
	})

module.exports = Login