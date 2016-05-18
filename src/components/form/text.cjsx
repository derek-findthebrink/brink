React = require("react")

Input = React.createClass({
	getInitialState: ->
		return {
			value: ""
		}
	componentWillMount: ->
		@setState({
			value: @props.value
			})
	change: (e)->
		@setState({
			value: e.target.value
			})
	onBlur: (e)->
		@props.onChange(e)
	render: ->
		<div>
			<input type={@props.type} name={@props.name} value={@state.value} onChange={@change} onBlur={@onBlur} />
		</div>
	})

Textarea = React.createClass({
	getInitialState: ->
		return {
			value: ""
		}
	componentWillMount: ->
		@setState({
			value: @props.value
			})
	change: (e)->
		@setState({
			value: e.target.value
			})
	onBlur: (e)->
		@props.onChange(e)
	render: ->
		<div>
			<textarea name={@props.name} value={@state.value} onChange={@change} onBlur={@onBlur} />
		</div>
	})


module.exports = {
	Input
	Textarea
}