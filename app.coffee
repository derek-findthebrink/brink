require("coffee-react/register")
require("dotenv").config()

express = require "express"
bodyParser = require "body-parser"
bunyan = require("bunyan")
cookieParser = require("cookie-parser")
webpack = require("webpack")
webpackMiddleware = require("webpack-dev-middleware")
webpackHotMiddleware = require("webpack-hot-middleware")
config = require("./webpack.config.coffee")
_ = require("lodash")


# Logger
# ---------------------------------------
logBase = require("./config/logger")

# Global
global.appLogger = bunyan.createLogger({
	name: "brink-server"
	src: process.env.NODE_ENV == "development"
	})


# File-Local
log = appLogger.child({
	type: "app"
	file: "app"
	})

# Webpack
# --------------------------
# remove for production?
compiler = webpack(config)


# Database
# -----------------------------------------
mongoose = require("./config/mongoose").mongoose


# Server Initialization
# ------------------------------------------
app = express()
app.application_name = "brink-server"
app.set("views", "views")
app.set("view engine", "jade")

app.use bodyParser.json()
app.use bodyParser.urlencoded({
	extended: true
	})
app.use cookieParser()
app.use(webpackMiddleware(compiler))
app.use(webpackHotMiddleware(compiler))
app.use(express.static("./assets"))

# Request Logger
app.use logBase.requestLogger({
	logger: log
	})


# Routes
# --------------------------------------------
homeRoutes = require "./api/routes/home"
adminRoutes = require("./api/routes/admin")

app.use("/", homeRoutes)
app.use("/admin", adminRoutes)


# Server Start
# ------------------------------
server = app.listen(process.env.PORT, ->
	host = server.address().address
	port = server.address().port
	if host == "::"
		host = "localhost"
	log.info {host: host, port: port, env: process.env.NODE_ENV}, "\n----- Server Initialization -----\n"
	)

