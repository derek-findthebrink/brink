React = require("react")
{asyncConnect} = require("redux-async-connect")

{Field, ButtonField} = require("../form/form.cjsx")
{ADD_ASSET, DELETE_ASSET, EDIT_ASSET} = require("../../actions/types/library").actions


_add = {
	url:
		type: "text"
		name: "url"
}

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
			<Field settings={_add.url} model={@state} change={@change} />
			<ButtonField>
				<input type="submit" value="submit!" onClick={@submit} />
			</ButtonField>
		</form>
	})

_library = {
	alt:
		type: "text"
		name: "alt"
	url:
		type: "text"
		name: "url"
	type:
		type: "select"
		name: "type"
	title:
		type: "text"
		name: "title"
}

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
		styles = require("./library.sass")
		<li className={styles.item}>
			<form>
				<Field type="custom">
					<img src={model.url} className={styles.img} />
				</Field>
				<Field settings={_library.alt} model={model} change={change} />
				<Field settings={_library.url} model={model} change={change} />
				<Field settings={_library.type} model={model} change={change}>
					<option>icon</option>
					<option>image</option>
				</Field>
				<Field settings={_library.title} model={model} change={change} />
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
		styles = require("./library.sass")
		<div className={styles.container}>
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