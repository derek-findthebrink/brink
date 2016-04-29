React = require("react")
_ = require("lodash")

{Field, ButtonField} = require("../form/form.cjsx")

try
	log = appLogger.child({
		type: "components"
		file: "edit"
	})
catch
	log = console
	log.info = console.log


ImgEditor = React.createClass({
	render: ->
		<div>
			
		</div>
	})

FormBase = React.createClass({
	submit: (e)->
		e.preventDefault()
		# e.stopPropogation()
		console.log props:@props, state:@state
	render: ->
		styles = require("./edit.sass")
		<li className={styles.editItem}>
			<form method="post" action={@props.action} onSubmit={@submit}>
				{@props.children}
				<ButtonField>
					<input type="submit" value="save" />
				</ButtonField>
			</form>
		</li>
	})


ProductsItem = React.createClass({
	render: ->
		# console.log props:@props
		styles = require("./edit.sass")
		<FormBase action={@props.action}>
			<Field name="category" type="text" value={@props.category} change={@props.change("category")} />
			<Field name="product" type="text" value={@props.product} change={@props.change("product")} />
			<Field name="title" type="text" value={@props.title} change={@props.change("title")} />
			<Field name="description" type="textarea" value={@props.description} change={@props.change("description")} />
			<Field name="unitsAvailable" label="units available" type="number" change={@props.change("unitsAvailable")} value={@props.unitsAvailable} />
			<Field name="active" label="is active" type="checkbox" value={@props.active} change={@props.change("active")} />
		</FormBase>
	})

StackItem = React.createClass({
	render: ->
		styles = require("./edit.sass")
		<FormBase action={@props.action}>
			<Field name="title" type="text" value={@props.title} change={@props.change("title")} />
			<Field name="description" type="textarea" change={@props.change("description")} value={@props.description} />
			<Field name="secondary" label="is secondary" type="checkbox" change={@props.change("secondary")} value={@props.secondary} />
		</FormBase>
	})


Edit = React.createClass({
	change: (model)->
		section = @props.params.section
		dispatch = @props.dispatch
		return (key)->
			return (e)->
				_m = _.clone(model)
				_m[key] = e.target.value
				s = {
					type: ["update", section].join("_").toUpperCase()
					model: _m
				}
				dispatch(s)
	render: ->
		section = @props.params.section
		# console.log props:@props
		switch section
			when "products" then ItemClass = ProductsItem
			when "stack" then ItemClass = StackItem
			else
				return log.error err: new Error("Could not parse section type"), "error parsing section"
		items = @props[section].map (x, i)=>
			<ItemClass {...x} action={"/api/post/edit/" + section + "/" + x._id} change={@change(x)} key={i} />

		styles = require("./edit.sass")
		<div className={styles.container}>
			<h2>{section}</h2>
			<ul>
				{items}
			</ul>
			<div className={styles.footerButtons}>
				<button>refresh all</button>
				<button>commit</button>
			</div>
		</div>
	})

{connect} = require("react-redux")

mapStateToProps = (state)->
	# console.log "map state to props ran"
	return {
		products: state.products.items
		stack: state.stack.items
	}

Final = connect(
	mapStateToProps
	)(Edit)

module.exports = Final
