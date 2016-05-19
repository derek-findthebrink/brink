# Requires
# ----------------------------------
nodepath = require("path")
# server
express = require "express"
# rendering
React = require("react")
ReactServer = require("react-dom/server")
render = require("./helpers/server-rendering")
Q = require("q")
Client = require("./helpers/api-client")
sitemap = require("./analytics/sitemap")


# Logger
# ----------------------------
try
	log = appLogger.child({
		type: "main-render"
		file: "home"
		})
catch
	log = console
	log.info = console.log

# Dependency Resolution
# ------------------------------

APP_ROOT = process.env.APP_ROOT

renderApp = render({
	storeLocation: nodepath.resolve(APP_ROOT, "src/redux/index.coffee")
	routesLocation: nodepath.resolve(APP_ROOT, "src/router/app-router.cjsx")
	app: "app"
	})

renderAdmin = render({
	storeLocation: nodepath.resolve(APP_ROOT, "src/redux/admin-index.coffee")
	routesLocation: nodepath.resolve(APP_ROOT, "src/router/admin-router.cjsx")
	baseName: "/admin"
	app: "admin"
	})


isLoggedIn = (req, res, next)->
	# log.info user:req.user, cookies:req.cookies, "user auth"
	client = new Client(req)
	client.auth()
	.then(
		(val)->
			# log.info val:val, "isLogged in val"
			if !val
				res.redirect("/login")
			else
				next()
		(err)->
			log.error err:err, "isLoggedIn error"
			res.status(500).end()
		)



Login = require("./components/login/login.cjsx")
_Login = React.createClass({
	render: ->
		<div>
			<Login />
		</div>
	})

renderLogin = (req, res)->
	_el = React.createElement(_Login)
	html = ReactServer.renderToString(_el)
	assets = webpackIsomorphicTools.assets()
	res.render("layout", {
		content: html
		appCss: assets.styles.admin
		appJsSrc: null
		})


home = express.Router()
home.get "/login", renderLogin
home.get "/admin", isLoggedIn, renderAdmin
home.get "/admin/*", isLoggedIn, renderAdmin
home.get "/sitemap.xml", sitemap

home.get "*", renderApp

module.exports = home
