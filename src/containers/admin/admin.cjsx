React = require("react")
{asyncConnect} = require("redux-async-connect")

Header = require("../../components/header/header.cjsx")
DevTools = require("../../components/devtools.cjsx")

Admin = React.createClass({
	render: ->

		adminLinks = [
			{
				to: "/admin"
				title: "dashboard"
			}
			{
				to: "/admin/edit/products"
				title: "products"
			}
			{
				to: "/admin/edit/stack"
				title: "stack"
			}

		]

		if __DEVTOOLS__
			dev = <DevTools />
		else
			dev = null

		console.log props: @props

		<div>
			<Header links={adminLinks} title="brink admininstration" titleLink="/admin" />
			<main>
				{@props.children}
			</main>
			{dev}
		</div>
	})

isLoaded = (key, s)->
	state = s.reduxAsyncConnect
	return state[key] && state[key].loaded

AsyncAdmin = asyncConnect({
	user: (params, {store, auth})->
		{dispatch, getState} = store
		if (!isLoaded("user", getState()))
			return auth()
	products: (params, {store, get})->
		{dispatch, getState} = store
		if (!isLoaded("products", getState()))
			return get("products")
	stack: (params, {store, get})->
		{dispatch, getState} = store
		if (!isLoaded("stack", getState()))
			return get("stack")
	})(Admin)

module.exports = AsyncAdmin