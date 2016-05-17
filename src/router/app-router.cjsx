try
	log = appLogger.child({
		type: "router"
		file: "app"
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
{
	App
	Home
	Product
	Portfolio
	About
	Stack
	Contact
	Learn
	NotFound
	CampaignOne
	PP
	TAC
} = require("../containers")

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
			<Route path="learn/:product" component={Learn} />

			<Route path="/privacy-policy" component={PP} />
			<Route path="/terms-and-conditions" component={TAC} />

			<Route path="/donate" component={CampaignOne} />

		</Route>
		<Route path="*" component={NotFound} />
	</Router>

module.exports = AppRouter