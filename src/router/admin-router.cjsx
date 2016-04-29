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

{App, Dashboard, Login, Edit} = require("../containers/adminIndex")


AdminRouter = (history, store)->
	requireLogin = (nextState, replace, cb)->
		log.info nextState:nextState
		log.info store:store.getState()
		return cb()
	
	<Router history={history}>
		<Route path="/login" component={App}>
			<IndexRoute component={Login} />
		</Route>

		<Route path="/admin" onEnter={requireLogin} component={App}>
			<IndexRoute component={Dashboard} />
			<Route path="edit/:section" component={Edit} />
		</Route>

	</Router>

module.exports = AdminRouter