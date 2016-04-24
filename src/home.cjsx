# Requires
# ----------------------------------
nodepath = require("path")
# server
express = require "express"
# rendering
React = require("react")
ReactServer = require("react-dom/server")
{
	RouterContext
	match
	createRoutes
	createMemoryHistory
} = require("react-router")
# data, redux, async rendering
_ = require("lodash")
Q = require("q")
{ReduxAsyncConnect, loadOnServer} = require("redux-async-connect")
{Provider} = require("react-redux")
{get} = require("./helpers/apiClient")



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

routesGenerator = require "./router/app-router"


base = (req, res)->
	if __DEVELOPMENT__
		webpackIsomorphicTools.refresh()
	_h = createMemoryHistory()
	# injects history and views logic into app-router for rendering
	routes = routesGenerator(_h)
	# creates location match for use in following match function
	location = _h.createLocation(req.originalUrl)
	store = require("./redux")(null)


	assets = webpackIsomorphicTools.assets()
	css = assets.styles.app || null
	app = assets.javascript.app

	_getData = ()->
		return get("products")

	_getHtml = (routes, location, store)->
		def = Q.defer()
		match({routes, location}, (err, redirect, props)->
			# log.info {url: req.url, location: location, routes:routes}, "match occurred"
			if err
				log.error err, "error"
				return def.reject(err)

			else if redirect
				# add redirect logic here
				log.info redirect: redirect, "redirect requested"

			else if props
				log.info "attempting load on server"
				loadOnServer(props, store, {get}).then ->
					final = (
						<Provider store={store}>
							<ReduxAsyncConnect {...props} />
						</Provider>
						)
					html = ReactServer.renderToString final
					return def.resolve(html)
			)
		return def.promise

	_getHtml(routes, location, store)
	.then(
		(html)->
			# return data to client
			res.render("layout", {
				content: html
				appCss: css
				appJsSrc: app
				})
			return
		(err)->
			log.error err:err, "rendering failed"
			res.status(500).end()
		)
	.then(
		->
			log.info "data rendering complete"
		(err)->
			log.error err:err, "error after spread promise"
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
