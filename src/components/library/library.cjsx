React = require("react")

{Field, ButtonField} = require("../form/form.cjsx")

Add = React.createClass({
	getInitialState: ->
		return {
			url: ""
			file: ""
		}
	change: (key)->
		return (e)=>
			val = e.target.value
			@setState(->
				x = {}
				x[key] = val
				return x
				)
	render: ->
		<form>
			<h3>Add</h3>
			<Field type="text" name="url" value={@state.url} change={@change("url")} />
			<ButtonField>
				<input type="submit" value="submit!" />
			</ButtonField>
		</form>
	})

ListItem = React.createClass({
	change: (key)->
		return (e)=>
			val = e.target.value
			@setState(->
				x = {}
				x[key] = val
				return x
				)
	render: ->
		console.log "list item render attempt"
		change = @change
		<li>
			<form>
				<Field type="custom">
					<img src={@props.src} />
				</Field>
				<Field name="alt" value={@props.alt} change={change("alt")} />
				<Field name="src" value={@props.src} change={change("src")} />
				<ButtonField>
					<button>delete</button>
					<input type="submit" value="submit!" />
				</ButtonField>
			</form>
		</li>
	})

List = React.createClass({
	render: ->
		items = @props.items
		if items && items.length && items.length > 0
			list = items.map (x, i)->
				<ListItem {...x} key={i} />
		else
			list = <p>no items!</p>

		<ul>
			{list}
		</ul>
	})

Library = React.createClass({
	render: ->
		list = [
			{
				src: "/icons/brink-icons_uptime.svg"
				alt: "uptime icon"
			}
		]
		<div>
			<h2>Library</h2>
			<Add />
			<List items={list} />
		</div>
	})

module.exports = Library