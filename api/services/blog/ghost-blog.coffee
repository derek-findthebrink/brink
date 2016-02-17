ghost = require "ghost"
express = require "express"
path = require "path"

AppLogger = require "../../../log/logger"
BlogConfig = require "./config"


# Logic
# ---------------
env = process.env.NODE_ENV || "development"

app = express()
app.application_name = "brink-blog"

logOpts = {
	appSegment: "brink-blog"
}
log = new AppLogger(app, logOpts).initialize()

log.info {logger: log.fields}, "ghost-logger info"
log.info {blogConfig: BlogConfig[env]}, "ghost-config"

ghost({
	config: path.join(__dirname, "config.js")
	})
.then((ghostServer)->
	app.use(ghostServer.config.paths.subdir, ghostServer.rootApp)
	ghostServer.start(app)
	)