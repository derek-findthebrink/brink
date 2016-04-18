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

try
	log = appLogger.child({
		type: "route"
		file: "home"
		})
catch
	log = console
	log.info = console.log

ROOT_DIR = process.env.APP_ROOT

routerLocation = nodepath.resolve ROOT_DIR, "router/app-router.cjsx"
viewsLocation = nodepath.resolve ROOT_DIR, "assets"
views_post = ".generated.js"

routesGenerator = require routerLocation
views = {
	home: require(nodepath.join(viewsLocation, "home" + views_post))
	portfolio: require(nodepath.join(viewsLocation, "portfolio" + views_post))
	stack: require(nodepath.join(viewsLocation, "stack" + views_post))
	product: require(nodepath.join(viewsLocation, "product" + views_post))
	contact: require(nodepath.join(viewsLocation, "contact" + views_post))
	app: require(nodepath.join(viewsLocation, "app" + views_post))
}
# views = require(nodepath.join(viewsLocation, "main" + views_post))
console.log views

base = (req, res)->
	_h = createMemoryHistory()
	routes = routesGenerator(_h, views)
	location = _h.createLocation(req.url)

	match({routes, location}, (err, redirect, props)->
		log.info "match occurred"
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


# Receive Customer Data
# captcha disabled while in development

# home.post("/contact", inputData, renderThanks)
# home.post("/contact", checkCaptcha, inputData, renderThanks)

module.exports = home
