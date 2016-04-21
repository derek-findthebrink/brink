require("coffee-react/register")

nodepath = require("path")

express = require "express"
bodyParser = require "body-parser"
bunyan = require("bunyan")
cookieParser = require("cookie-parser")
passport = require("passport")
LocalStrategy = require("passport-local").Strategy
session = require("express-session")
MongoStore = require("connect-mongo")(session)
compression = require("compression")
# favicon = require("serve-favicon")


# vars
# -------------------------------
ROOT = nodepath.resolve(process.env.APP_ROOT)
STATIC_DIR = nodepath.resolve(ROOT, process.env.STATIC_DIR)



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

# if process.env.HMR == "true"
# 	log.info "loading webpack middleware..."
# 	require("./loaders/webpack-middleware.coffee")(app)

app.application_name = "brink-server"
app.set("views", "views")
app.set("view engine", "jade")
app.use(compression())

app.use bodyParser.json()
app.use bodyParser.urlencoded({
	extended: true
	})
app.use cookieParser()

# static dir
app.use(express.static(STATIC_DIR))
# app.use(favicon(favicon_location))









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

auth = require("./config/auth")
auth(app, passport, Account)








# Request Logger
# -----------------------------
if process.env.LOG_REQUESTS == "true"
	app.use logBase.requestLogger({
		logger: log
		})







# Routes
# --------------------------------------------
homeRoutes = require "./api/routes/home"
app.use("/", homeRoutes)

# disabled admin for massive ui changes
# adminRoutes = require("./api/routes/admin")
# app.use("/admin", adminRoutes)







# Server Start
# ------------------------------
server = app.listen(process.env.PORT, ->
	host = server.address().address
	port = server.address().port
	if host == "::"
		host = "localhost"
	log.info {host: host, port: port, env: process.env.NODE_ENV}, "\n----- Server Initialization -----\n"
	)

