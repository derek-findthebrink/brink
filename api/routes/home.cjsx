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
ROOT_DIR = process.env.APP_ROOT

routerLocation = nodepath.resolve ROOT_DIR, "router/app-router.cjsx"
routesGenerator = require routerLocation
# _getView = (name)->
# 	return nodepath.join(viewsLocation, name + views_post)
# views = {
# 	home: require _getView("home")
# 	portfolio: require _getView("portfolio")
# 	stack: require _getView("stack")
# 	product: require _getView("product")
# 	contact: require _getView("contact")
# 	app: require _getView("app")
# 	about: require _getView("about")
# }
# views = require(nodepath.join(viewsLocation, "main" + views_post))

base = (req, res)->
	_h = createMemoryHistory()
	# injects history and views logic into app-router for rendering
	routes = routesGenerator(_h)
	# creates location match for use in following match function
	location = _h.createLocation(req.url)
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
			final = <RouterContext {...props} />
			html = ReactServer.renderToString final
			res.render("layout", {
				content: html
				css: css
				appCss: "/css/app.css"
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
