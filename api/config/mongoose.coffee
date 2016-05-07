mongoose = require("mongoose")
_ = require("lodash")

try
	log = appLogger.child({
		type: "config"
		file: "mongoose"
		})
catch e
	log = require("bunyan").createLogger({
		name: "db-config"
		type: "config"
		file: "mongoose"
		})


index = require("../models")
_.map (x, i)->
	require(x)

url = process.env.MONGOOSE_DB
mongoose.connect(url, (err)->
	if err
		return log.error {err:err}, "mongoose connection error"
	)
# mongoose.Promise = require("q")

exports.mongoose = mongoose
