require("coffee-react/register")
require("dotenv").config()

express = require "express"
bodyParser = require "body-parser"
bunyan = require("bunyan")
cookieParser = require("cookie-parser")
passport = require("passport")
LocalStrategy = require("passport-local").Strategy
session = require("express-session")
MongoStore = require("connect-mongo")(session)
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


# Database
# -----------------------------------------
mongoose = require("./config/mongoose").mongoose
Account = mongoose.model("Account")


# Server Initialization
# ------------------------------------------
app = express()

if process.env.NODE_ENV == "development"
	require("./webpack-middleware.coffee")(app)

app.application_name = "brink-server"
app.set("views", "views")
app.set("view engine", "jade")

app.use bodyParser.json()
app.use bodyParser.urlencoded({
	extended: true
	})
app.use cookieParser()
app.use(express.static("./assets"))


# Passport
# ------------------------------------
mongoStoreOptions = {
	mongooseConnection: mongoose.connection
	ttl: 14 * 24 * 60 * 60
}

app.use session({
	secret: process.env.SESSION_KEY
	store: new MongoStore(mongoStoreOptions)
	resave: false
	saveUninitialized: true
})
app.use passport.initialize()
app.use passport.session()


passport.use Account.createStrategy()
passport.serializeUser Account.serializeUser()
passport.deserializeUser Account.deserializeUser()


# Request Logger
# -----------------------------
app.use logBase.requestLogger({
	logger: log
	})


# Routes
# --------------------------------------------
homeRoutes = require "./api/routes/home"
app.use("/", homeRoutes)

# disabled admin for massive ui changes
adminRoutes = require("./api/routes/admin")
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

