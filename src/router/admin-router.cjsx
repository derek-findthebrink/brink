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

{App, Dashboard} = require("../containers/adminIndex")

AdminRouter = (history)->
	<Router history={history}>
		<Route path="/admin" component={App}>
			<IndexRoute component={Dashboard} />
		</Route>
	</Router>

module.exports = AdminRouter