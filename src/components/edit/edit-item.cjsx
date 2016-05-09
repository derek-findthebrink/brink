React = require("react")
_ = require("lodash")
{connect} = require("react-redux")
{SAVE_EDIT, UPDATE_EDITOR, CREATE_EDITOR, VALUE_PUSH, VALUE_SPLICE} = require("../../actions/types/model").actions

{Field, ButtonField} = require("../form/form.cjsx")



# Segments
# -----------------------------------------------------------


FormBase = React.createClass({
	render: ->
		styles = require("./edit.sass")
		<li className={styles.editItem}>
			<form method="post" action={@props.action} onSubmit={@props.submit}>
				{@props.children}
				<ButtonField>
					<button>cancel</button>
					<input type="submit" value="save" />
				</ButtonField>
			</form>
		</li>
	})



# Products

imageInitial = {
	img: ""
	alt: ""
	description: ""
}
includesInitial = ""

ProductsItem = React.createClass({
	render: ->
		model = @props.model
		includes = model.includes.map (x, i)=>
			styles = require("./edit.sass")
			<div className={styles.listEditor} key={i}>
				<input type="text" onChange={@props.change("includes[" + i + "]")} value={x} />
				<iron-icon icon="icons:remove" onClick={@props.valueSlice("includes", i)} />
			</div>

		libraryOptions = @props.library.map (x, i)->
			<option key={i} value={x.url}>{x.title}</option>

		makeImageList = (segment)=>
			styles = require("./edit.sass")
			model.learnData[segment].map (x,i)=>
				root = "learnData." + segment + "[" + i + "]"
				_seg = "learnData." + segment

				<div className={styles.learnImage} key={i}>
					<div className={styles.menu}>
						<img src={x.img} />
						<iron-icon icon="icons:remove" onClick={@props.valueSlice(_seg, i)} />
					</div>
					<div>
						<label>img</label>
						<select name="img" value={x.img} onChange={@props.change(root + ".img")}>
							{libraryOptions}
						</select>
					</div>
					<div>
						<label>alt</label>
						<input type="text" name="alt" value={x.alt} onChange={@props.change(root + ".alt")} />
					</div>
					<div>
						<label>description</label>
						<input type="text" name="description" value={x.description} onChange={@props.change(root + ".description")} />
					</div>
				</div>

		inputs = makeImageList("inputs")
		process = makeImageList("process")
		outputs = makeImageList("outputs")

		styles = require("./edit.sass")
		<FormBase action={@props.action} submit={@props.submit}>
			<h3>General</h3>
				<Field name="category" type="text" value={model.category} change={@props.change("category")} />
				<Field name="title" type="text" value={model.title} change={@props.change("title")} />
				<Field name="product" label="slug" type="text" value={model.product} change={@props.change("product")} />
				<Field name="description" type="textarea" value={model.description} change={@props.change("description")} />
				<Field type="custom" label="includes">
					{includes}
					<iron-icon icon="icons:add" onClick={@props.push("includes", includesInitial)} />
				</Field>
			<h3>Image</h3>
				<Field type="custom">
					<img src={model.img} className={styles.editImage} />
				</Field>
				<Field type="custom" label="img">
					<select name="img" value={model.img} onChange={@props.change("img")}>
						{libraryOptions}
					</select>
				</Field>
			<h3>Price and Units</h3>
				<Field name="unitsAvailable" label="units available" type="number" change={@props.change("unitsAvailable")} value={model.unitsAvailable} />
				<Field type="currency" value={model.price} label="price" change={@props.change} />
				<Field name="active" label="is active" type="checkbox" value={model.active} change={@props.change("active")} />
			<h3>Learn</h3>
				<Field type="textarea" name="description" value={model.learnData.description} change={@props.change("learnData.description")} />
				<Field type="custom" label="inputs">
					{inputs}
					<iron-icon icon="icons:add" onClick={@props.push("learnData.inputs", imageInitial)} />
				</Field>
				<hr />
				<Field type="custom" label="process">
					{process}
					<iron-icon icon="icons:add" onClick={@props.push("learnData.process", imageInitial)} />
				</Field>
				<hr />
				<Field type="custom" label="outputs">
					{outputs}
					<iron-icon icon="icons:add" onClick={@props.push("learnData.outputs", imageInitial)} />
				</Field>
				<hr />
				<Field name="result" type="text" value={model.learnData.result} change={@props.change("learnData.result")} />

		</FormBase>
	})


# About

AboutItem = React.createClass({
	render: ->
		styles = require("./edit.sass")
		model = @props.model
		change = @props.change

		<FormBase submit={@props.submit}>
			<Field name="name" value={model.name} change={change("name")} />
		</FormBase>
	})


# About

PortfolioItem = React.createClass({
	render: ->
		styles = require("./edit.sass")
		model = @props.model
		change = @props.change

		<FormBase submit={@props.submit}>
			<Field name="title" value={model.title} change={change("title")} />
		</FormBase>
	})


# Stack

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

ConnectAbout = connect(
	baseMapState
	)(AboutItem)

ConnectPortfolio = connect(
	baseMapState
	)(PortfolioItem)



# Editor Class
# ---------------------------------------------------------


EditItem = React.createClass({
	push: (keys, initial)->
		return =>
			@props.dispatch({
				type: VALUE_PUSH
				keys: keys
				initial: initial
				})
	splice: (keys, index)->
		return =>
			@props.dispatch({
				type: VALUE_SPLICE
				keys: keys
				index: index
				})
	change: (keys)->
		return (e)=>
			@props.dispatch({
				type: UPDATE_EDITOR
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
			type: CREATE_EDITOR
			model: @model
			})
	render: ->
		action = {"/herp/derp/glerp"}
		switch @section
			when "stack" then ItemClass = ConnectStack
			when "products" then ItemClass = ConnectProduct
			when "about" then ItemClass = ConnectAbout
			when "portfolio" then ItemClass = ConnectPortfolio
			else
				return console.error new Error "could not parse edit item"
		Item = <ItemClass valueSlice={@splice} change={@change} push={@push} library={@props.library} changeSub={@changeSub} submit={@save} action={action} />
		styles = require("./edit.sass")
		<div className={styles.container}>
			{Item}
		</div>
	})

mapStateToProps = (state)->
	return {
		stack: state.stack.get("items")
		products: state.products.get("items")
		library: state.library.get("items")
		about: state.about.get("items")
		portfolio: state.portfolio.get("items")
	}

Final = connect(
	mapStateToProps
	)(EditItem)

module.exports = Final