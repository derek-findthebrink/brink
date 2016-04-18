try
	log = appLogger.child({
		type: "app-router"
		file: "router"
	})
catch
	log = console
	log.info = console.log

React = require("react")
{
	Router
	Route
	IndexRoute
} = require("react-router")

content = require("../content/index")

AppRouter = (history, views)->
	# log.info views:views, "views"
	# console.log views, "views (console.log api)"

	<Router history={history}>
		<Route path="/" component={views["app"]}>
			<IndexRoute component={views["home"]} />
			<Route path="portfolio" component={views["portfolio"]} />
			<Route path="stack" component={views["stack"]} />
			<Route path="contact" component={views["contact"]} />
			<Route path="products-and-services(/:section)" component={views["product"]} />
		</Route>
	</Router>

module.exports = AppRouter