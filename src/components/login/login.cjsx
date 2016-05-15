React = require("react")
_ = require("lodash")

{Field, ButtonField} = require("../form/form.cjsx")

_login = {
	email:
		type: "text"
		name: "email"
	password:
		type: "password"
		name: "password"
}

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
		<div className={styles.container}>
			<h2>Login</h2>
			<form action="/api/admin-auth/login" method="post">
				<h2>{@props.title}</h2>
				<Field settings={_login.email} model={@state} change={@change} />
				<Field settings={_login.password} model={@state} change={@change} />
				<ButtonField>
					<input type="submit" value="Submit" />
				</ButtonField>
			</form>
		</div>
	})

module.exports = Login