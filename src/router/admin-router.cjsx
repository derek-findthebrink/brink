try
	log = appLogger.child({
		type: "router"
		file: "admin"
	})
catch
	log = console
	log.info = console.log

React = require("react")
{Router, Route, IndexRoute} = require("react-router")
{asyncConnect} = require("redux-async-connect")

{App, Dashboard, Login, Edit, EditItem} = require("../containers/adminIndex")


AdminRouter = (history, store)->
	requireLogin = (nextState, replace, cb)->
		log.info nextState:nextState
		data = store.getState()
		if !data.user.isLoggedIn
			console.log "replace ran"
			replace("/login")
		return cb()
	
	<Router history={history}>
		<Route path="/admin" component={App}>
			<IndexRoute component={Dashboard} />
			<Route path="edit/:section" component={Edit} />
			<Route path="edit/:section/:id" component={EditItem} />
		</Route>

	</Router>

module.exports = AdminRouter