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
Client = require("./helpers/apiClient")


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
# ROOT_DIR = process.env.APP_ROOT

# routesGenerator = require "./router/app-router"

renderApp = render({
	storeLocation: nodepath.resolve(__dirname, "redux.coffee")
	routesLocation: nodepath.resolve(__dirname, "router/app-router.cjsx")
	app: "app"
	})

renderAdmin = render({
	storeLocation: nodepath.resolve(__dirname, "redux/admin-index.coffee")
	routesLocation: nodepath.resolve(__dirname, "router/admin-router.cjsx")
	baseName: "/admin"
	app: "admin"
	})


isLoggedIn = (req, res, next)->
	log.info user:req.user, cookies:req.cookies, "user auth"
	_c = new Client(req)
	_c.auth()
	.then(
		(val)->
			log.info val:val, "isLogged in val"
			if !val
				res.redirect("/login")
			else
				next()
		(err)->
			log.error err:err, "isLoggedIn error"
			res.status(500).end()
		)



# App = require("./containers/admin/admin.cjsx")
# Login = require("./components/login/login.cjsx")
# _Login = React.createClass({
# 	render: ->
# 		<App>
# 			<Login />
# 		</App>
# 	})

# renderLogin = (req, res)->
# 	_el = React.createElement(_Login)
# 	html = ReactServer.renderToString(_el)
# 	assets = webpackIsomorphicTools.assets()
# 	res.render("layout", {
# 		content: html
# 		appCss: assets.styles.admin
# 		appJsSrc: null
# 		})


home = express.Router()
home.get "/", renderApp
home.get "/portfolio", renderApp
home.get "/stack", renderApp
home.get "/products-and-services", renderApp
home.get "/products-and-services/:sub", renderApp
home.get "/contact", renderApp
home.get "/about", renderApp

home.get "/admin", isLoggedIn, renderAdmin
home.get "/login", renderAdmin
home.get "/admin/edit/:section", renderAdmin


# Receive Customer Data
# captcha disabled while in development

# home.post("/contact", inputData, renderThanks)
# home.post("/contact", checkCaptcha, inputData, renderThanks)

module.exports = home
