bunyan = require "bunyan"
uuid = require "uuid"
_ = require "lodash"
async = require "async"



# Serializers
# ------------------------------------
reqSerializer = (req)->
	return {
		method: req.method
		url: req.url
		# headers: req.headers
	}

exports.serializers = {
	reqSerializer
}





# Specific Loggers
# -----------------------------------------

requestLogger = (opts)->
	logger = opts.logger || appLogger
	headerName = opts.headerName || "x-request-id"
	
	return (req, res, next)->
		id = req.headers[headerName] || uuid.v4()
		now = Date.now()
		logData = {
			reqType: req.method
			cookies: req.cookies
			ip: req.ip
			originalUrl: req.originalUrl
			user: req.user || false
		}

		req.log = logger.child({
			type: "request"
			id: id
			})

		if req.body
			logData.body = req.body

		res.setHeader(headerName, id)
		# req.log.info startOpts, "start request"

		time = process.hrtime()
		res.on("finish", ->
			diff = process.hrtime(time)
			endData = {
				# res: res
				durationMs: diff[0] * 1e3 + diff[1] * 1e-6
			}
			final = _.extend logData, endData
			req.log.info final, "request"
			)

		next()


exports.requestLogger = requestLogger