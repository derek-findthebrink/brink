try
	log = appLogger.child({
		type: "app-router"
		file: "router"
	})
catch
	log = console
	log.info = console.log


React = require("react")
{Router, Route, IndexRoute} = require("react-router")




# Content/Redux
# --------------------------------------
content = require("../../content/index")

# Views
# --------------------------------
views_dir = "../views/react/"

App = require("../views/react/app.cjsx")
Home = require("../views/react/home.cjsx")
Product = require("../views/react/product.cjsx")
Portfolio = require("../views/react/portfolio.cjsx")
About = require("../views/react/about.cjsx")
Stack = require("../views/react/stack.cjsx")
Contact = require("../views/react/contact.cjsx")

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