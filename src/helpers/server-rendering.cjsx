# Requires
# ------------------------------------
nodepath = require("path")
# rendering
React = require("react")
ReactServer = require("react-dom/server")
{
	RouterContext
	match
	createRoutes
	createMemoryHistory
	useRouterHistory
} = require("react-router")
# data, redux, async rendering
_ = require("lodash")
Q = require("q")
{ReduxAsyncConnect, loadOnServer} = require("redux-async-connect")
{Provider} = require("react-redux")


Client = require("./api-client")
ieTest = require("./ie-support")

try
	log = appLogger.child({
		type: "helpers"
		file: "server-rendering"
	})
catch
	log = console
	log.info = console.log


# VARS
# -----------------------------------


# Rendering
# ---------------------------------------------

render = (segment)->
	# define segment-specific components here
	_storeGenerator = segment.storeLocation
	_routeGenerator = segment.routesLocation
	_baseName = segment.baseName || null
	_app = segment.app

	return (req, res)->
		_generatePage = (html, css, app, polyfill)->
			res.render("layout", {
				content: html
				appCss: css
				appJsSrc: app
				polyfill: polyfill
				})

		if __DEVELOPMENT__
			webpackIsomorphicTools.refresh()

		assets = webpackIsomorphicTools.assets()
		css = assets.styles[_app] || null
		app = assets.javascript[_app] || null

		if ieTest.test(req)
			console.log "polyfill required"
			polyfill = assets.javascript.polyfill
		else
			polyfill = null

		if __DISABLE_SSR__
			log.info "SSR is disabled"
			return _generatePage("<div>disabled ssr</div>", css, app, polyfill)

		

		_h = createMemoryHistory()
		store = require(_storeGenerator)(null)
		routes = require(_routeGenerator)(_h, store)
		location = _h.createLocation(req.originalUrl)
		
		client = new Client(req)

		_getHtml = (routes, location, store)->
			def = Q.defer()
			match({routes, location}, (err, redirect, props)->
				if err
					log.error err:err, "rendering error"
					return def.reject(err)
				else if redirect
					res.redirect(redirect.pathname + redirect.search)
				else if props
					loadOnServer(props, store, client)
					.then(
						()-> 
							final = (
								<Provider store={store}>
									<ReduxAsyncConnect {...props} helpers={client} />
								</Provider>
							)
							html = ReactServer.renderToString final
							return def.resolve(html)
						(err)->
							log.error err:err, "load on server error"
							return def.reject(err)
						)
				else
					error = new Error("Not Found")
					log.error err:error, _e:err, url:req.originalUrl, "could not find requested"
				)
			return def.promise


		_getHtml(routes, location, store, polyfill)
		.then(
			(html)->
				_generatePage(html, css, app, polyfill)
			(reason)->
				log.error err:reason, "error rendering data"
				res.status(500)
				_generatePage("<div>error loading page, hydrating...</div>")
			)
		.catch(log.error)

module.exports = render