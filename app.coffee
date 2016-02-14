express = require "express"
bodyParser = require "body-parser"
logger = require "morgan"


# logic
# ------------------------------------------
app = express()
app.applicationName = "brink-server"

app.set("views", "views")
app.set("view engine", "jade")

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
	extended: true
	}))
app.use(logger("dev"))
app.use(express.static("./assets"))


# routes
# --------------------------------------------
homeRoutes = require "./api/routes/home"
app.use("/", homeRoutes)


console.log("node env", app.get("env"))
server = app.listen(process.env.PORT, ->
	host = server.address().address
	port = server.address().port
	if host == "::"
		host = "localhost"
	console.log("%s listening at http://%s:%s", app.applicationName, host, port)
	)
