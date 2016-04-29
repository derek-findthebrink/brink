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
_Client = require("./apiClient")

try
	log = appLogger.child({
		type: "helpers"
		file: "server-rendering"
	})
catch
	log = console
	log.info = console.log

render = (segment)->
	# define segment-specific components here
	_storeGenerator = segment.storeLocation
	_routeGenerator = segment.routesLocation
	_baseName = segment.baseName || null
	_app = segment.app
	return (req, res)->
		log.info "request begins"
		client = new _Client(req)
		_getHtml = (routes, location, store)->
			log.info "get html"
			def = Q.defer()
			match({routes, location}, (err, redirect, props)->
				if err
					log.error err:err, "rendering error"
					return def.reject(err)
				else if redirect
					log.warn redirect:redirect, "redirect requested"
					return
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

		_generatePage = (html, css, app)->
			res.render("layout", {
				content: html
				appCss: css
				appJsSrc: app
				})

		if __DEVELOPMENT__
			webpackIsomorphicTools.refresh()

		assets = webpackIsomorphicTools.assets()
		css = assets.styles[_app] || null
		app = assets.javascript[_app] || null

		# __DISABLE_SSR__ = true
		if __DISABLE_SSR__
			return _generatePage("<div>disabled ssr</div>", css, app)

		# if _baseName
		# 	log.info "creating history w/ basename"
		# 	_h = useRouterHistory(createMemoryHistory)({
		# 		base: _baseName
		# 		})
		# else
		_h = createMemoryHistory()

		log.info "generating else"
		store = require(_storeGenerator)(null)
		routes = require(_routeGenerator)(_h, store)
		location = _h.createLocation(req.originalUrl)


		_getHtml(routes, location, store)
		.then(
			(html)->
				_generatePage(html, css, app)
				log.info "data rendering complete"
			(reason)->
				log.error err:reason, "error rendering data"
				res.status(500).end()
			)

module.exports = render