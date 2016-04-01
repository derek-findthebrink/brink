express = require "express"
bodyParser = require "body-parser"
bunyan = require("bunyan")

global.appLogger = bunyan.createLogger({
	name: "brink-server"
	})

log = appLogger.child({
	type: "app"
	file: "app"
	})


# logic
# ------------------------------------------
env = process.env.NODE_ENV || "development"

# mongoose = require("./config/mongoose").mongoose

app = express()
app.application_name = "brink-server"
app.set("views", "views")
app.set("view engine", "jade")

app.use bodyParser.json()
app.use bodyParser.urlencoded({
	extended: true
	})
app.use(express.static("./assets"))

# routes
# --------------------------------------------
homeRoutes = require "./api/routes/home"
app.use("/", homeRoutes)



server = app.listen(process.env.PORT, ->
	host = server.address().address
	port = server.address().port
	if host == "::"
		host = "localhost"
	log.info {host: host, port: port}, "\n----- Server Initialization -----\n"
	)

