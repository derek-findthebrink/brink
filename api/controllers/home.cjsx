React = require("react")
ReactServer = require("react-dom/server")
{
	RouterContext
	match
	createRoutes
	createMemoryHistory
	} = require("react-router")
Q = require("q")
_ = require("underscore")
nodepath = require("path")

# Logger
# ----------------------------------
try
	log = appLogger.child({
		type: "controller"
		file: "home"
		})
catch e
	log = console
	log.info = console.log

# Content
# -------------------------------------
CONTENT_DIR = "../../content/"
content = require(CONTENT_DIR + "index")

# Router
# -----------------------------------------
AppRouter = require("../../router/app-router")
log.info {dir: process.cwd(), cd: __dirname}, "current working dir"


baseRender = (req, res)->
	log.info "base render"
	views = require("../../views/react/index.cjsx")
	log.info views:views, dir: process.cwd(), cd: __dirname, "base render on express router home"

	log.info AppRouter:AppRouter, url:req.url, "app router"
	_h = createMemoryHistory()
	routes = AppRouter(_h, views)
	location = _h.createLocation(req.url)

	match({routes, location}, (err, redirectLocation, renderProps)->
		if err
			log.error err, "error"
			res.status(500).end()
		else if redirectLocation
			log.info redirectLocation, "redirect"
		else if renderProps
			log.info renderProps, "renderProps"
			res.status(200).send(ReactServer.renderToString(<RouterContext {...renderProps} />))
		)

# each must expose locals "content", "user"



module.exports = {
	home: baseRender
	portfolio: baseRender
	stack: baseRender
	contact: baseRender
	productsAndServices: baseRender
	productsAndServicesSub: baseRender
	productLearn: baseRender
	contactProduct: baseRender

	# inputData: inputData
	# renderThanks: renderThanks
}