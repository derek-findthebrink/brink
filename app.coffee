express = require "express"
bodyParser = require "body-parser"
logger = require "morgan"
# session = require "express-session"
# passport = require "passport"
# mongoose = require "mongoose"
# cookieParser = require "cookie-parser"
flash = require "connect-flash"


# logic
# ------------------------------------------
app = express()
app.applicationName = "daytimer"

app.set("views", "views")
app.set("view engine", "jade")

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
	extended: true
	}))
app.use(logger("dev"))
app.use(flash())
app.use(express.static("./assets"))
# app.use(cookieParser())
# app.use(session({
# 	name: "daytimer"
# 	secret: "omglerpderpyersnootygoose"
# 	resave: false
# 	saveUninitialized: false
# 	cookie:
# 		maxAge: 1000 * 60 * 60 * 5
# 	}))
# app.use(passport.initialize())
# app.use(passport.session())

# database


# routes
# --------------------------------------------
homeRoutes = require "./api/routes/home"
app.use("/", homeRoutes)


console.log("node env", app.get("env"))
server = app.listen(2150, ->
	host = server.address().address
	port = server.address().port
	if host == "::"
		host = "localhost"
	console.log("%s listening at http://%s:%s", app.applicationName, host, port)
	)
