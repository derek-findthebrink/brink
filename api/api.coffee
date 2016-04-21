express = require("express")
bodyParser = require("body-parser")
passport = require("passport")
LocalStrategy = require("passport-local").Strategy
session = require("express-session")
cookieParser = require("cookie-parser")
MongoStore = require("connect-mongo")(session)

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

mongoose = require("./config/mongoose").mongoose
Account = mongoose.model("Account")

app = express()

app.use bodyParser.json()
app.use bodyParser.urlencoded({
	extended: true
	})
app.use cookieParser()

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



server = app.listen(process.env.API_PORT, ->
	host = server.address().address
	port = server.address().port
	if host == "::"
		host = "localhost"
	log.info {host:host, port:port, env: process.env.NODE_ENV}, "\n------- API Server init ----------\n"
	)