React = require("react")
_ = require("lodash")

{Field, ButtonField} = require("../_base")


ImgEditor = React.createClass({
	render: ->
		<div>
			
		</div>
	})



ProductsItem = React.createClass({
	render: ->
		console.log props:@props
		<li>
			<form>
				<Field name="category" type="text" value={@props.category} />
				<Field name="product" type="text" value={@props.product} />
				<Field name="title" type="text" value={@props.title} />
				<Field name="description" type="textarea" value={@props.description} />
				<Field name="unitsAvailable" label="units available" type="number" value={@props.unitsAvailable} />
				<Field name="available" label="is available" type="checkbox" value={@props.available} />
				<ButtonField>
					<input type="submit" value="submit" />
				</ButtonField>
			</form>
		</li>
	})

StackItem = React.createClass({
	render: ->
		<li>
			<form>
				<Field name="title" type="text" value={@props.title} />
				<Field name="description" type="textarea" value={@props.description} />
				<Field name="secondary" label="is secondary" type="checkbox" value={@props.secondary} />
				<ButtonField>
					<input type="submit" value="submit" />
				</ButtonField>
			</form>
		</li>
	})


Editor = React.createClass({
	render: ->
		console.log props:@props

		ItemContainer = null
		switch @props.section
			when "products" then ItemContainer = ProductsItem
			when "stack" then ItemContainer = StackItem
			else
				log.error new Error("could not parse section " + @props.section)

		items = @props.items.map (x, i)->
			x.key = i
			return React.createElement(ItemContainer, x)

		<div className="editor">
			<h4>Editor</h4>
			<ul>
				{items}
			</ul>
		</div>
	})

Edit = React.createClass({
	render: ->
		<div>
			<h2>{@props.section}</h2>
			<Editor {...@props} />
		</div>
	})

module.exports = Edit