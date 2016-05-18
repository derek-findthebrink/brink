require("coffee-react/register")

nodepath = require("path")
express = require "express"
bunyan = require("bunyan")
cookieParser = require("cookie-parser")
compression = require("compression")
http = require("http")
httpProxy = require("http-proxy")
superagent = require("superagent")
client = require("./helpers/api-client")
helmet = require("helmet")
# favicon = require("serve-favicon")

# vars
# -------------------------------
ROOT = nodepath.resolve(process.env.APP_ROOT)
STATIC_DIR = nodepath.resolve(ROOT, process.env.STATIC_DIR)

# Logger
# ---------------------------------------
logBase = require("../api/config/logger")

# Global
logOpts = {
	name: "brink-render-server"
}


if process.env.NODE_ENV == "development"
	# logOpts.stream = "process.stdout"
	logOpts.src = true

if process.env.NODE_ENV == "production"
	logsRoot = nodepath.join(__dirname, "../logs")
	logOpts.streams = [
		{
			path: nodepath.resolve(logsRoot, "render-server-access.log")
			name: "ACCESS"
			level: "info"
		}
		{
			path: nodepath.resolve(logsRoot, "render-server-error.log")
			name: "ERROR"
			level: "error"
		}
	]

global.appLogger = bunyan.createLogger(logOpts)
# File-Local
log = appLogger.child({
	type: "app"
	file: "app"
	})

# Server Initialization
# ------------------------------------------
app = express()
app.use(helmet())
server = new http.Server(app)

viewsDir = nodepath.resolve __dirname, "containers"

app.application_name = "brink-server"
app.set("views", viewsDir)
app.set("view engine", "jade")
app.use(compression())

app.use cookieParser()

# static dir
app.use(express.static(STATIC_DIR))
app.use(express.static(STATIC_DIR + "/favicon/"))

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
	log.info {api: targetUrl}, "api target"
	)

