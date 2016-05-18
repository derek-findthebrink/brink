express = require("express")
bodyParser = require("body-parser")
passport = require("passport")
LocalStrategy = require("passport-local").Strategy
session = require("express-session")
cookieParser = require("cookie-parser")
MongoStore = require("connect-mongo")(session)
SocketIo = require "socket.io"
http = require("http")
helmet = require("helmet")
csrf = require("csurf")
redisClient = require("redis").createClient()
nodepath = require("path")

# Logger
# ------------------------------------------
bunyan = require("bunyan")

logBase = require("./config/logger")

logOpts = {
	name: "brink-api-server"
}
if process.env.NODE_ENV == "development"
	logOpts.src = true

if process.env.NODE_ENV == "production"
	logsRoot = nodepath.join(__dirname, "../logs")
	logOpts.streams = [
		{
			path: nodepath.resolve(logsRoot, "api-access.log")
			name: "ACCESS"
			level: "info"
		}
		{
			path: nodepath.resolve(logsRoot, "api-error.log")
			name: "ERROR"
			level: "error"
		}
	]

global.appLogger = bunyan.createLogger(logOpts)

log = appLogger.child({
	type: "server"
	file: "api"
	})

# Database
# -----------------------------------
mongoose = require("./config/mongoose").mongoose
Account = mongoose.model("Account")

# Initialization
# ---------------------------------
csrfProtection = csrf({
	cookie: false
	})
app = express()
app.use(helmet())
server = new http.Server(app)

# websocket
# io = new SocketIo(server)
# io.path("/ws")

app.use bodyParser.json()
app.use bodyParser.urlencoded({
	extended: true
	})
app.use cookieParser()

if (app.get("env") == "production")
	app.set("trust proxy", 1)

# Auth
# ------------------------
mongoStoreOptions = {
	mongooseConnection: mongoose.connection
	ttl: 14 * 24 * 60 * 60
}

sessOpts = {
	secret: process.env.SESSION_KEY
	name: "bt-ap1"
	store: new MongoStore(mongoStoreOptions)
	resave: false
	saveUninitialized: true
	cookie:
		httpOnly: true
}

if (app.get("env") == "production")
	sessOpts.cookie.secure = true
	sessOpts.cookie.domain = process.env.HOST
	
app.use session(sessOpts)


# Limiter
# ---------------------------------------
# limit login requests to 150 per hour

limiter = require("express-limiter")(app, redisClient)
limiter({
	path: "/admin-auth/login"
	method: "post"
	lookup: ["headers.x-forwarded-for"]
	total: 150
	expire: 1000 * 60 * 60
	})
limiter({
	path: "/app"
	method: "get"
	lookup: ["headers.x-forwarded-for"]
	total: 1000
	expire: 1000 * 60 * 60
	})
limiter({
	path: "/post"
	method: "post"
	lookup: ["headers.x-forwarded-for"]
	total: 1000
	expire: 1000 * 60 * 60
	})

# Flux
# --------------------------------------
Flux = require("./services/flux")
global.flux = new Flux()

isLoggedIn = (req, res, next)->
	if req.user
		return next()
	return res.status(403).end()

# Routes
# -------------------------------------
auth = require("./config/auth")
auth(app, passport, Account)

# app data


check = (req, res, next)->
	obj = {
		cookies: req.cookies
		session: req.session
		body: req.body
		headers: req.headers
	}
	log.info obj, "check middleware"
	return next()

modifyTokenPlacement = (req, res, next)->
	body = req.body
	model = body.model
	if model._csrf
		body._csrf = model._csrf
		delete model._csrf
	return next()


getAppData = require("./routes/get-app")
postData = require("./routes/post-app")
adminAuth = require("./routes/admin-auth")(passport)
postAdmin = require("./routes/post-admin")

app.get("/app", csrfProtection, getAppData)
app.post("/post", modifyTokenPlacement, csrfProtection, postData)
app.use("/admin-auth", adminAuth)
app.use("/admin/post", isLoggedIn, postAdmin)

# Server Start
# ------------------------------------------------
server.listen(process.env.API_PORT, ->

	# io.on("connection", (socket)->
	# 	socket.emit("news", {msg: "hello world! Love, the websocket api server"})

	# 	socket.on("msg", (data)->
	# 		log.info {type: "socket", message: data}, "socket received message"
	# 		socket.emit("msg", data)
	# 		)
	# 	)

	# io.listen(server)

	host = server.address().address
	port = server.address().port
	if host == "::"
		host = "localhost"
	log.info {host:host, port:port, env: process.env.NODE_ENV}, "\n------- API Server init ----------\n"
	)