express = require("express")
bodyParser = require("body-parser")
passport = require("passport")
LocalStrategy = require("passport-local").Strategy
session = require("express-session")
cookieParser = require("cookie-parser")
MongoStore = require("connect-mongo")(session)
SocketIo = require "socket.io"
http = require("http")


# Logger
# ------------------------------------------
bunyan = require("bunyan")

logBase = require("./config/logger")

global.appLogger = bunyan.createLogger({
	name: "brink-api-server"
	src: process.env.NODE_ENV == "development"
	})

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
app = express()

# websocket
server = new http.Server(app)
io = new SocketIo(server)
io.path("/ws")

app.use bodyParser.json()
app.use bodyParser.urlencoded({
	extended: true
	})
app.use cookieParser()




# Auth
# ------------------------

mongoStoreOptions = {
	mongooseConnection: mongoose.connection
	ttl: 14 * 24 * 60 * 60
}

app.use session({
	secret: process.env.SESSION_KEY
	name: "bt-ap1"
	store: new MongoStore(mongoStoreOptions)
	resave: false
	saveUninitialized: true
})


# Flux
# --------------------------------------
Flux = require("./services/flux")
global.flux = new Flux()

# Routes
# -------------------------------------

auth = require("./config/auth")
auth(app, passport, Account)

# app data
getAppData = require("./routes/get-app")
app.get("/app", getAppData)

postData = require("./routes/post-api")
app.use("/post", postData(mongoose))

adminAuth = require("./routes/admin-auth")(passport)
app.use("/admin-auth", adminAuth)


# Services
# ----------------------------------------------
# mailgun


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