React = require("react")
_ = require("lodash")

{Field, ButtonField} = require("../form/form.cjsx")


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
		styles = require("./login.sass")
		if @props.title == "register"
			username = <Field name="username" type="text" value={@state.username} change={@change("username")} />
		<div className={styles.container}>
			<h2>Login</h2>
			<form action="/api/admin-auth/login" method="post">
				<h2>{@props.title}</h2>
				<Field name="email" value={@state.email} change={@change("email")} />
				<Field name="password" type="password" value={@state.password} change={@change("password")} />
				{username || null}
				<ButtonField>
					<input type="submit" value="Submit" />
				</ButtonField>
			</form>
		</div>
	})

module.exports = Login