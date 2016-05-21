React = require("react")
{Field} = require("../form/form.cjsx")

meta = {
	description:
		name: "description"
		type: "text"
	og_site_name:
		name: "og:site_name"
		type: "text"
	og_image:
		name: "og:image"
		type: "text"
	og_locale:
		name: "og:locale"
		type: "text"
	og_name:
		name: "og:name"
		type: "text"
	og_description:
		name: "og:description"
		type: "text"
	og_card:
		name: "og:card"
		type: "text"
	og_site:
		name: "og:site"
		type: "text"
	og_creator:
		name: "og:creator"
		type: "text"
}

Meta = React.createClass({
	onChange: ->
		return ->
			console.log "on change triggered"
	render: ->
		model = {}
		items = _.map meta, (x, i)=>
			<Field settings={x} model={model} change={@onChange} key={i} />
		<div>
			<h3>Meta</h3>
			{items}
		</div>
	})

Settings = React.createClass({
	render: ->
		styles = require("./settings.sass")
		<div className={styles.container}>
			<h2>Settings</h2>
			<Meta />
		</div>
	})

module.exports = Settings