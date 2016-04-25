require("coffee-react/register")

nodepath = require("path")

express = require "express"
bodyParser = require "body-parser"
bunyan = require("bunyan")
cookieParser = require("cookie-parser")
compression = require("compression")
http = require("http")
httpProxy = require("http-proxy")
# favicon = require("serve-favicon")


# vars
# -------------------------------
ROOT = nodepath.resolve(process.env.APP_ROOT)
STATIC_DIR = nodepath.resolve(ROOT, process.env.STATIC_DIR)



# Logger
# ---------------------------------------
logBase = require("../api/config/logger")

# Global
global.appLogger = bunyan.createLogger({
	name: "brink-main-server"
	src: process.env.NODE_ENV == "development"
	})


# File-Local
log = appLogger.child({
	type: "app"
	file: "app"
	})


# Database
# -----------------------------------------
# mongoose = require("./config/mongoose").mongoose
# Account = mongoose.model("Account")



# Server Initialization
# ------------------------------------------
app = express()
server = new http.Server(app)

# if process.env.HMR == "true"
# 	log.info "loading webpack middleware..."
# 	require("./loaders/webpack-middleware.coffee")(app)
viewsDir = nodepath.resolve __dirname, "containers"

app.application_name = "brink-server"
app.set("views", viewsDir)
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

# API Server Proxy
# ----------------------------------
apiHost = process.env.API_HOST
apiPort = process.env.API_PORT
targetUrl = "http://" + apiHost + ":" + apiPort

proxy = httpProxy.createProxyServer({
	target: targetUrl
	ws: true
	})

app.use("/api", (req, res)->
	proxy.web(req, res, {target: targetUrl})
	)

app.use("/ws", (req, res)->
	proxy.web(req, res, {target: targetUrl + "/ws"})
	)

server.on("upgrade", (req, socket, head)->
	proxy.ws(req, socket, head)
	)

# proxy error listener
proxy.on("error", (err, req, res)->
	if err.code != "ECONNRESET"
		log.error err:err, "proxy error"
	if (!res.headersSent)
		res.writeHead(500, {"content-type": "application/json"})
	json = {error: "proxy_error", reason: err.message}
	res.end(JSON.stringify(json))
	)







# Passport
# ------------------------------------
# mongoStoreOptions = {
# 	mongooseConnection: mongoose.connection
# 	ttl: 14 * 24 * 60 * 60
# }

# app.use session({
# 	secret: process.env.SESSION_KEY
# 	store: new MongoStore(mongoStoreOptions)
# 	resave: false
# 	saveUninitialized: true
# })

# auth = require("./config/auth")
# auth(app, passport, Account)








# Request Logger
# -----------------------------
if process.env.LOG_REQUESTS == "true"
	app.use logBase.requestLogger({
		logger: log
		})







# Routes
# --------------------------------------------
homeRoutes = require "./home.cjsx"
app.use("/", homeRoutes)

# disabled admin for massive ui changes
# adminRoutes = require("./api/routes/admin")
# app.use("/admin", adminRoutes)







# Server Start
# ------------------------------
server.listen(process.env.PORT, (err)->
	if err
		log.error err:err, "server start error"
	host = server.address().address
	port = server.address().port
	if host == "::"
		host = "localhost"
	log.info {host: host, port: port, env: process.env.NODE_ENV}, "\n----- Server Initialization -----\n"
	)

