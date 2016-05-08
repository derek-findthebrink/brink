React = require("react")
_ = require("lodash")
{Link} = require("react-router")

{Field, ButtonField} = require("../form/form.cjsx")

try
	log = appLogger.child({
		type: "components"
		file: "edit"
	})
catch
	log = console
	log.info = console.log




ListBase = React.createClass({
	render: ->
		styles = require("./edit.sass")
		<li className={styles.listBase}>
			<Link to={@props.to}>
				{@props.children}
			</Link>
		</li>
	})




ProductsListItem = React.createClass({
	render: ->
		<ListBase to={@props.to}>
			<div>
				<h3>{@props.category}</h3>
				<h2>{@props.title}</h2>
			</div>
			<div>
				<p>{@props.description}</p>
			</div>
		</ListBase>
	})

StackListItem = React.createClass({
	render: ->
		<ListBase to={@props.to}>
			<div>
				<h2>{@props.title}</h2>
			</div>
			<div>
				<p>{@props.description}</p>
			</div>
		</ListBase>
	})

AboutListItem = React.createClass({
	render: ->
		<ListBase to={@props.to}>
			<div>
				<h2>{@props.name}</h2>
			</div>
		</ListBase>
	})

PortfolioListItem = React.createClass({
	render: ->
		<ListBase to={@props.to}>
			<div>
				<h2>{@props.title}</h2>
			</div>
		</ListBase>
	})



Edit = React.createClass({
	render: ->
		section = @props.params.section
		console.log props:@props
		switch section
			when "products" then ItemClass = ProductsListItem
			when "stack" then ItemClass = StackListItem
			when "about" then ItemClass = AboutListItem
			when "portfolio" then ItemClass = PortfolioListItem
			else
				return log.error err: new Error("Could not parse section type"), "error parsing section"
		items = @props[section].map (x, i)=>
			to = ["/admin/edit", section, x._id].join("/")
			<ItemClass {...x} to={to} key={i} />

		styles = require("./edit.sass")
		<div className={styles.container}>
			<ul>
				{items}
			</ul>
		</div>
	})

{connect} = require("react-redux")

mapStateToProps = (state)->
	# console.log "map state to props ran"
	return {
		products: state.products.get("items")
		stack: state.stack.get("items")
		about: state.about.get("items")
		portfolio: state.portfolio.get("items")
	}

Final = connect(
	mapStateToProps
	)(Edit)

module.exports = Final
