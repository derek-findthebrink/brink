ghost = require "ghost"
express = require "express"
path = require "path"

BlogConfig = require "./config"

try
	log = appLogger.child({
		type: "service"
		file: "blog/ghost-blog"
		})
catch e
	log = console
	log.info = console.log



# Logic
# ---------------
env = process.env.NODE_ENV

log.info blogConfig:BlogConfig[env], "blog config"

app = express()
app.application_name = "brink-blog"

logOpts = {
	appSegment: "brink-blog"
}
log = new AppLogger(app, logOpts).initialize((err, log)->
	if err
		console.log error
		throw err
	log.info {logger: log.fields}, "ghost-logger info"
	log.info {blogConfig: BlogConfig[env]}, "ghost-config"

	ghost({
		config: path.join(__dirname, "config.js")
		})
	.then((ghostServer)->
		app.use(ghostServer.config.paths.subdir, ghostServer.rootApp)
		ghostServer.start(app)
		)
	)

