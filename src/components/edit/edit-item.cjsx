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


makeLibraryOptions = (library)->
	return library.map (x, i)->
		<option key={i} value={x.url}>{x.title}</option>

makeImageList = (root, segment, model)->
	styles = require("./edit.sass")

	libraryOptions = makeLibraryOptions(@props.library)

	if root
		list = model[root][segment]
	else
		list = model[segment]
	# model.learnData[segment]
	list.map (x,i)=>
		if root
			_root = root + "." + segment + "[" + i + "]"
			_seg = root + "." + segment
		else
			_root = segment + "[" + i + "]"
			_seg = segment

		<div className={styles.learnImage} key={_root + String i}>
			<div className={styles.menu}>
				<img src={x.img} />
				<iron-icon icon="icons:remove" onClick={@props.valueSlice(_seg, i)} />
			</div>
			<div>
				<label>img</label>
				<select name="img" value={x.img} onChange={@props.change(_root + ".img")}>
					{libraryOptions}
				</select>
			</div>
			<div>
				<label>alt</label>
				<input type="text" name="alt" value={x.alt} onChange={@props.change(_root + ".alt")} />
			</div>
			<div>
				<label>description</label>
				<input type="text" name="description" value={x.description} onChange={@props.change(_root + ".description")} />
			</div>
		</div>

createIncludes = (x, i)->
	styles = require("./edit.sass")
	<div className={styles.listEditor} key={i}>
		<input type="text" onChange={@props.change("includes[" + i + "]")} value={x} />
		<iron-icon icon="icons:remove" onClick={@props.valueSlice("includes", i)} />
	</div>






# Products
_product = {
	category:
		type: "text"
		name: "category"
	title:
		type: "text"
		name: "title"
	product:
		type: "text"
		name: "product"
	description:
		type: "textarea"
		name: "description"
	unitsAvailable:
		type: "number"
		name: "unitsAvailable"
	price:
		name: "price"
		type: "currency"
		label: "price"
	active:
		type: "checkbox"
		name: "active"
		label: "is active"
	learn:
		description:
			type: "textarea"
			label: "description"
			name: "learn-description"
			keyLocation: "learnData.description"
		result:
			type: "text"
			label: "result"
			name: "learn-result"
			keyLocation: "learnData.result"
}

ProductsItem = React.createClass({
	render: ->
		model = @props.model
		change = @props.change

		includes = model.includes.map createIncludes.bind(this)
		libraryOptions = makeLibraryOptions(@props.library)
		inputs = makeImageList.bind(this)("learnData", "inputs", model)
		process = makeImageList.bind(this)("learnData", "process", model)
		outputs = makeImageList.bind(this)("learnData", "outputs", model)

		styles = require("./edit.sass")
		<FormBase action={@props.action} submit={@props.submit}>
			<h3>General</h3>
				<Field settings={_product.category} model={model} change={change} />
				<Field settings={_product.title} model={model} change={change} />
				<Field settings={_product.product} model={model} change={change} />
				<Field settings={_product.description} model={model} change={change} />
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
				<Field settings={_product.unitsAvailable} model={model} change={change} />
				<Field settings={_product.price} model={model} change={change} />
				<Field settings={_product.active} model={model} change={change} />
			<h3>Learn</h3>
				<Field settings={_product.learn.description} model={model} change={change} />
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
				<Field settings={_product.learn.result} model={model} change={change} />
		</FormBase>
	})


# About
_about = {
	name:
		name: "name"
		type: "text"
	description:
		name: "description"
		type: "textarea"
}

AboutItem = React.createClass({
	render: ->
		styles = require("./edit.sass")
		model = @props.model
		change = @props.change

		libraryOptions = makeLibraryOptions(@props.library)
		styles = require("./edit.sass")

		<FormBase submit={@props.submit}>
			<Field settings={_about.name} model={model} change={change} />
			<Field settings={_about.description} model={model} change={change} />
			<Field type="custom">
				<img src={model.image} className={styles.editImage} />
			</Field>
			<Field type="custom" label="image">
				<select value={model.image} onChange={change("image")}>
					{libraryOptions}
				</select>
			</Field>
		</FormBase>
	})


# Portfolio
_portfolio = {
	title:
		type: "text"
		name: "title"
	type:
		type: "text"
		name: "type"
	img:
		type: "custom"
		name: "img"
	alt:
		type: "text"
		name: "alt"
	commissioner:
		type: "text"
		name: "commissioner"
	status:
		type: "text"
		name: "status"
	description:
		type: "textarea"
		name: "description"
}

PortfolioItem = React.createClass({
	render: ->
		styles = require("./edit.sass")
		model = @props.model
		change = @props.change

		libraryOptions = makeLibraryOptions(@props.library)
		includes = model.includes.map createIncludes.bind(this)
		includeImgs = makeImageList.bind(this)(null, "includesImg", model)

		<FormBase submit={@props.submit}>
			<Field settings={_portfolio.title} model={model} change={change} />
			<Field settings={_portfolio.type} model={model} change={change} />
			<Field type="custom">
				<img src={model.img} className={styles.editImage} />
			</Field>
			<Field label="img" type="custom">
				<select value={model.img} onChange={change("img")}>
					{libraryOptions}
				</select>
			</Field>
			<Field settings={_portfolio.alt} model={model} change={change} />
			<Field settings={_portfolio.commissioner} model={model} change={change} />
			<Field settings={_portfolio.status} model={model} change={change} />
			<Field settings={_portfolio.description} model={model} change={change} />
			<Field type="custom" label="includes">
				{includes}
				<iron-icon icon="icons:add" onClick={@props.push("includes", includesInitial)} />
			</Field>
			<Field type="custom" label="images">
				{includeImgs}
				<iron-icon icon="icons:add" onClick={@props.push("includesImg", imageInitial)} />
			</Field>
		</FormBase>
	})


# Stack

_stack = {
	imgSrc:
		name: "img-src"
		label: "img src"
		type: "text"
		keyLocation: "img.src"
	imgAlt:
		name: "img-alt"
		label: "img alt"
		type: "text"
		keyLocation: "img.alt"
	imgHref:
		name: "img-href"
		label: "img href"
		type: "text"
		keyLocation: "img.href"
	title:
		name: "title"
		type: "text"
	description:
		name: "description"
		type: "textarea"
}

StackItem = React.createClass({
	render: ->
		styles = require("./edit.sass")
		model = @props.model

		<FormBase action={@props.action} submit={@props.submit}>
			<Field type="custom">
				<img src={@props.model.img.src} className={styles.editImage} />
			</Field>
			<Field settings={_stack.imgSrc} model={model} change={@props.change} />
			<Field settings={_stack.imgAlt} model={model} change={@props.change} />
			<Field settings={_stack.imgHref} model={model} change={@props.change} />
			<Field settings={_stack.title} model={model} change={@props.change} />
			<Field settings={_stack.description} model={model} change={@props.change} />
		</FormBase>
	})


# Email

_email = {
	title:
		name: "title"
		keyLocation: "title"
		type: "text"
		label: "title"
	content:
		name: "content"
		type: "rich"
		label: "content"
}

EmailItem = React.createClass({
	render: ->
		styles = require("./edit.sass")
		model = @props.model
		<FormBase action={@props.action} submit={@props.submit}>

			<Field settings={_email.title} model={model} change={@props.change} />
			<Field settings={_email.content} model={model} change={@props.change} />
		
		</FormBase>
	})
			# <Field name="title" value={model.title} change={@props.change("title")} />
			# <Field name="content" type="rich" value={model.content} change={@props.change("content")} />


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

ConnectEmail = connect(
	baseMapState
	)(EmailItem)



# Editor Class
# ---------------------------------------------------------

propTypes = React.PropTypes

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
			console.log "editor updated"
	save: (e)->
		e.preventDefault()
		app.flux.dispatch({
			type: SAVE_EDIT
			modelType: @section
			})
	componentWillMount: ->
		id = @props.params.id
		@section = @props.params.section
		# console.log section:@section, id:id, items:@props[@section]
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
			when "emails" then ItemClass = ConnectEmail
			else
				return console.error new Error "could not parse edit item"
		Item = <ItemClass model={@model} valueSlice={@splice} change={@change} push={@push} library={@props.library} submit={@save} action={action} />
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
		emails: state.emails.get("items")
	}

Final = connect(
	mapStateToProps
	)(EditItem)

module.exports = Final