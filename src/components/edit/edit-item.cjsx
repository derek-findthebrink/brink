React = require("react")
_ = require("lodash")
{connect} = require("react-redux")
{SAVE_EDIT} = require("../../actions/model").actions

{Field, ButtonField} = require("../form/form.cjsx")

FormBase = React.createClass({
	render: ->
		styles = require("./edit.sass")
		<li className={styles.editItem}>
			<form method="post" action={@props.action} onSubmit={@props.submit}>
				{@props.children}
				<ButtonField>
					<input type="submit" value="save" />
				</ButtonField>
			</form>
		</li>
	})

ProductsItem = React.createClass({
	render: ->
		model = @props.model
		includes = model.includes.map (x, i)=>
			<input type="text" onChange={@props.change("includes[" + i + "]")} value={x} key={i} />

		styles = require("./edit.sass")
		<FormBase action={@props.action} submit={@props.submit}>
			<Field type="custom">
				<img src={model.img} className={styles.editImage} />
			</Field>
			<Field name="img" type="text" value={model.img} change={@props.change("img")} /> 
			<Field name="category" type="text" value={model.category} change={@props.change("category")} />
			<Field name="product" type="text" value={model.product} change={@props.change("product")} />
			<Field name="title" type="text" value={model.title} change={@props.change("title")} />
			<Field name="description" type="textarea" value={model.description} change={@props.change("description")} />
			<Field name="unitsAvailable" label="units available" type="number" change={@props.change("unitsAvailable")} value={model.unitsAvailable} />
			<Field type="custom" label="includes">
				{includes}
			</Field>
			<Field type="currency" value={model.price} label="price" change={@props.change} />
			<Field name="active" label="is active" type="checkbox" value={model.active} change={@props.change("active")} />
		</FormBase>
	})


StackItem = React.createClass({
	render: ->
		styles = require("./edit.sass")
		model = @props.model

		<FormBase action={@props.action} submit={@props.submit}>
			<Field type="custom">
				<img src={model.img.src} className={styles.editImage} />
			</Field>
			<Field name="img-src" label="img src" type="text" value={model.img.src} change={@props.change("img.src")} />
			<Field type="text" label="img alt" value={model.img.alt} change={@props.change("img.alt")} />
			<Field type="text" label="img href" value={model.img.href} change={@props.change("img.href")} />
			<Field name="title" type="text" value={model.title} change={@props.change("title")} />
			<Field name="description" type="textarea" change={@props.change("description")} value={model.description} />
			<Field name="secondary" label="is secondary" type="checkbox" change={@props.change("secondary")} value={model.secondary} />
		</FormBase>
	})

baseMapState = (state)->
	return {
		model: state.edit
	}

ConnectStack = connect(
	baseMapState
	)(StackItem)

ConnectProduct = connect(
	baseMapState
	)(ProductsItem)


EditItem = React.createClass({
	change: (keys)->
		return (e)=>
			@props.dispatch({
				type: "UPDATE_EDITOR"
				keys: keys
				value: e.target.value
				})
	save: (e)->
		e.preventDefault()
		app.flux.dispatch({
			type: SAVE_EDIT
			modelType: @section
			})
	componentWillMount: ->
		id = @props.params.id
		@section = @props.params.section
		@model = _.find @props[@section], (x, i)->
			return id == x._id
		dispatch = @props.dispatch
		dispatch({
			type: "CREATE_EDITOR"
			model: @model
			})
	render: ->
		action = {"/herp/derp/glerp"}
		switch @section
			when "stack" then ItemClass = ConnectStack
			when "products" then ItemClass = ConnectProduct
			else
				return log.error new Error "could not parse edit item"
		Item = <ItemClass change={@change} changeSub={@changeSub} submit={@save} action={action} />
		styles = require("./edit.sass")
		<div className={styles.container}>
			{Item}
		</div>
	})

mapStateToProps = (state)->
	return {
		stack: state.stack.get("items")
		products: state.products.get("items")
	}

Final = connect(
	mapStateToProps
	)(EditItem)

module.exports = Final