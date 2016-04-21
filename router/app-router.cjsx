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

views_dir = "../views/react/"

App = require(views_dir + "app" + ".cjsx")
Home = require(views_dir + "home" + ".cjsx")
Product = require(views_dir + "product" + ".cjsx")
Portfolio = require(views_dir + "portfolio" + ".cjsx")
About = require(views_dir + "about" + ".cjsx")
Stack = require(views_dir + "stack" + ".cjsx")
Contact = require(views_dir + "contact" + ".cjsx")

AppRouter = (history)->
	# log.info views:views, "views"
	# console.log views, "views (console.log api)"

	<Router history={history}>
		<Route path="/" component={App}>
			<IndexRoute component={Home} />
			<Route path="products-and-services(/:section)" component={Product} />
			<Route path="portfolio" component={Portfolio} />
			<Route path="about" component={About} />
			<Route path="stack" component={Stack} />
			<Route path="contact" component={Contact} />
		</Route>
	</Router>

module.exports = AppRouter