# Requires
# ----------------------------------
nodepath = require("path")
# server
express = require "express"
# rendering
render = require("./helpers/server-rendering")


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
	storeLocation: nodepath.resolve(__dirname, "redux")
	routesLocation: nodepath.resolve(__dirname, "router/app-router")
	app: "app"
	})

renderAdmin = render({
	storeLocation: nodepath.resolve(__dirname, "redux")
	routesLocation: nodepath.resolve(__dirname, "router/admin-router")
	baseName: "/admin"
	app: "admin"
	})




home = express.Router()
home.get "/", renderApp
home.get "/portfolio", renderApp
home.get "/stack", renderApp
home.get "/products-and-services", renderApp
home.get "/products-and-services/:sub", renderApp
home.get "/contact", renderApp
home.get "/about", renderApp

home.get "/admin", renderAdmin


# Receive Customer Data
# captcha disabled while in development

# home.post("/contact", inputData, renderThanks)
# home.post("/contact", checkCaptcha, inputData, renderThanks)

module.exports = home
