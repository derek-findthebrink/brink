React = require("react")
{asyncConnect} = require("redux-async-connect")

Header = require("../../components/header/header.cjsx")
DevTools = require("../../components/devtools.cjsx")
Client = require("../../helpers/api-client")
Sidebar = require("../../components/sidebar/sidebar.cjsx")

Admin = React.createClass({
	childContextTypes: {
			flux: React.PropTypes.object
		}
	render: ->

		adminLinks = [
			{to: "/admin", title: "dashboard"}
			{to: "/admin/edit", title: "edit"}
			{to: "/admin/library", title: "library"}
			{to: "/admin/settings", title: "settings"}
		]

		if __DEVTOOLS__
			dev = <DevTools />
		else
			dev = null

		sliderLinks = [
			{href: "/api/admin-auth/logout", title: "logout"}
			{href: "/", title: "website"}
		]

		styles = require("./admin.sass")
		<div>
			<Header links={adminLinks} admin={true} slider={true} sliderLinks={sliderLinks} title="brink admininstration" titleLink="/admin" />
			<main className={styles.main}>
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
	library: (params, {store, get})->
		{dispatch, getState} = store
		if (!isLoaded("stack", getState()))
			return get("library")
	about: (params, {store, get})->
		{dispatch, getState} = store
		if (!isLoaded("about", getState()))
			return get("about")
	portfolio: (params, {store, get})->
		{dispatch, getState} = store
		if (!isLoaded("portfolio", getState()))
			return get("portfolio")
	emails: (params, {store, get})->
		{dispatch, getState} = store
		if (!isLoaded("emails", getState()))
			return get("emails")
	contacts: (params, {store, get})->
		{dispatch, getState} = store
		if (!isLoaded("contacts", getState()))
			return get("contacts")
	pages: (params, {store, get})->
		{dispatch, getState} = store
		if (!isLoaded("pages", getState()))
			return get("pages")
	})(Admin)

module.exports = AsyncAdmin