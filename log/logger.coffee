bunyan = require "bunyan"
uuid = require "uuid"
_ = require "underscore"
async = require "async"


reqSerializer = (req)->
	return {
		method: req.method
		url: req.url
		# headers: req.headers
	}

requestLogger = (opts)->
	logger = opts.logger
	headerName = opts.headerName || "x-request-id"
	appSegment = opts.appSegment || "unknown"
	
	return (req, res, next)->
		id = req.headers[headerName] || uuid.v4()
		now = Date.now()
		startOpts = {req: req}

		req.log = logger.child({
			type: "request"
			id: id
			appSegment: appSegment
			})

		if req.body
			startOpts.body = req.body

		res.setHeader(headerName, id)
		# req.log.info startOpts, "start request"

		time = process.hrtime()
		res.on("finish", ->
			diff = process.hrtime(time)
			endData = {
				res: res
				durationMs: diff[0] * 1e3 + diff[1] * 1e-6
			}
			final = _.extend startOpts, endData
			req.log.info final, "request"
			)

		next()



class BunyanLogger
	constructor: (@app, @opts)->
		@name = @app["application_name"]
		@env = @app.get("env")

	initialize: (cb)=>
		return @log @name, @env, @app, @opts, cb

	log: (name, env, app, opts, cb)->
		logger = null
		opts = opts || {}
		addedSerializers = {
			req: reqSerializer
		}
		serializers = _.extend bunyan.stdSerializers, addedSerializers
		basicLogger = {
			name: name
			env: env
			serializers: serializers
		}

		if env == "development"
			logger = bunyan.createLogger(basicLogger)
			reqOpts = {
				logger: logger
				headerName: opts.headerName
				}
			mergedOpts = _.extend(opts, reqOpts)
			app.use requestLogger(mergedOpts)

		else if env == "production"
			logger = bunyan.createLogger(basicLogger)

		else if env == "staging"
			logger = bunyan.createLogger(basicLogger)


		return cb(null, logger)
		
module.exports = BunyanLogger