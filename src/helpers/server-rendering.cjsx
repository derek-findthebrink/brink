nodepath = require("path")
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
{get} = require("./apiClient")


render = (segment)->
	# define segment-specific components here
	_storeGenerator = segment.storeLocation
	_routesGenerator = segment.routesLocation
	return (req, res)->
		_getHtml = (routes, location, store)->
			def = Q.defer()
			match({routes, location}, (err, redirect, props)->
				if err
					log.error err:err, "rendering error"
					return def.reject(err)
				else if redirect
					log.warn redirect:redirect, "redirect requested"
					return
				else if props
					loadOnServer(props, store, {get})
					.then(
						()->
							final = (
								<Provider store={store}>
									<ReduxAsyncConnect {...props} />
								</Provider>
							)
							html = ReactServer.renderToString final
							return def.resolve(html)
						(err)->
							log.error err:err, "load on server error"
							return def.reject(err)
						)
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
		css = assets.styles.app || null
		app = assets.javascript.app

		if __DISABLE_SSR__
			return _generatePage("<div>disabled ssr</div>", css, app)

		_h = createMemoryHistory()
		routes = require(_routeGenerator)(_h)
		location = _h.createLocation(req.originalUrl)
		store = require(_storeGenerator)(null)

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