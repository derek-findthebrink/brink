express = require "express"
React = require("react")
ReactServer = require("react-dom/server")
{
	RouterContext
	match
	createRoutes
	createMemoryHistory
} = require("react-router")
Q = require("q")
nodepath = require("path")
{Provider} = require("react-redux")
# Logger
# ----------------------------
try
	log = appLogger.child({
		type: "route"
		file: "home"
		})
catch
	log = console
	log.info = console.log

# Dependency Resolution
# ------------------------------
# ROOT_DIR = process.env.APP_ROOT

routerLocation = nodepath.resolve __dirname, "router/app-router.cjsx"
routesGenerator = require routerLocation


base = (req, res)->
	if __DEVELOPMENT__
		webpackIsomorphicTools.refresh()
	_h = createMemoryHistory()
	# injects history and views logic into app-router for rendering
	routes = routesGenerator(_h)
	# creates location match for use in following match function
	location = _h.createLocation(req.url)
	store = require("./redux")
	css = null
	switch req.url
		when "/" then css = "/css/home.css"
		when "/portfolio" then css = "/css/portfolio.css"
		when "/about" then css = "/css/about.css"
		when "/stack" then css = "/css/stack.css"
		when "/products-and-services" then css = "/css/product.css"
		when "/contact" then css = "/css/contact.css"
		else
			# need to create entire global styelsheet for fallback
			css = "/undefined"

	match({routes, location}, (err, redirect, props)->
		# log.info {url: req.url, location: location, routes:routes}, "match occurred"
		if err
			log.error err, "error"

		else if redirect
			log.info redirect: redirect, "redirect requested"
		else if props
			# insert required props for rendering
			# console.log "rendering props..", props
			assets = webpackIsomorphicTools.assets()

			appCss = assets.styles.app || null
			appJsSrc = assets.javascript.app

			# log.info assets:assets, "sent to client"
			final = (
				<Provider store={store}>
					<RouterContext {...props} />
				</Provider>
				)
			html = ReactServer.renderToString final
			res.render("layout", {
				content: html
				# css: css
				appCss: appCss
				appJsSrc: appJsSrc
				})
			res.end()
		)


home = express.Router()
home.get "/", base
home.get "/portfolio", base
home.get "/stack", base
home.get "/products-and-services", base
home.get "/products-and-services/:sub", base
home.get "/contact", base
home.get "/about", base


# Receive Customer Data
# captcha disabled while in development

# home.post("/contact", inputData, renderThanks)
# home.post("/contact", checkCaptcha, inputData, renderThanks)

module.exports = home
