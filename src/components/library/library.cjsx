React = require("react")
{asyncConnect} = require("redux-async-connect")

{Field, ButtonField} = require("../form/form.cjsx")
{ADD_ASSET, DELETE_ASSET, EDIT_ASSET} = require("../../actions/library").actions

addInitial = {
	url: ""
}

Add = React.createClass({
	getInitialState: ->
		return {
			url: ""
		}
	change: (key)->
		return (e)=>
			val = e.target.value
			@setState(->
				x = {}
				x[key] = val
				return x
				)
	submit: (e)->
		e.preventDefault()
		self = this
		model = @state
		app.flux.dispatch({
			type: ADD_ASSET
			model: model
			})
		.then(
			(val)->
				console.log val:val, "submit val success"
				self.setState({
					url: ""
					})
			(reason)->
				console.log "error submitting library"
				console.error reason
			)
	render: ->
		<form>
			<h3>Add</h3>
			<Field type="text" name="url" value={@state.url} change={@change("url")} />
			<ButtonField>
				<input type="submit" value="submit!" onClick={@submit} />
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
	delete: (e)->
		e.preventDefault()
		id = @props._id
		app.flux.dispatch({
			type: DELETE_ASSET
			model:
				_id: id
			})
	submit: (e)->
		e.preventDefault()
		model = @state
		console.log model:model
		app.flux.dispatch({
			type: EDIT_ASSET
			model: model
			})
	componentWillMount: ->
		@setState(@props)
	render: ->
		change = @change
		model = @state
		<li>
			<form>
				<Field type="custom">
					<img src={model.url} />
				</Field>
				<Field name="alt" value={model.alt} change={change("alt")} />
				<Field name="url" value={model.url} change={change("url")} />
				<Field name="type" type="select" value={model.type} change={change("type")}>
					<option>icon</option>
					<option>image</option>
				</Field>
				<Field name="title" value={model.title} change={change("title")} />
				<ButtonField>
					<button onClick={@delete}>delete</button>
					<input type="submit" value="submit!" onClick={@submit} />
				</ButtonField>
			</form>
		</li>
	})

List = React.createClass({
	render: ->
		items = @props.items.data
		if items && items.length && items.length > 0
			list = items.map (x, i)->
				<ListItem {...x} key={i} />
		else
			list = <p>no items!</p>

		console.log props:@props
		<ul>
			{list}
		</ul>
	})

Library = React.createClass({
	render: ->
		<div>
			<h2>Library</h2>
			<Add />
			<List items={@props.library} />
		</div>
	})

Final = asyncConnect({
	library: (params, {store, get})->
		{dispatch, getState} = store
		isLoaded = (s)->
			state = s.reduxAsyncConnect
			return state.library && state.library.loaded
		if (!isLoaded(getState()))
			return get("library")
	})(Library)

module.exports = Final