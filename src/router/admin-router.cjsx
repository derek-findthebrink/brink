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

{Admin} = require("../containers/adminIndex")

AdminRouter = (history)->
	<Router history={history}>
		<Route path="/" component={Admin}>
		</Route>
	</Router>

module.exports = AdminRouter