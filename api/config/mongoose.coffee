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

defs = {}

index = require("../models")
# makeDefs = (obj, cb)->
# 	models = mongoose.modelNames()
# 	_.map models, (val)->
# 		y = mongoose.model(val)
# 		x = new y().toJSON({
# 			getters: true
# 			depopulate: true
# 			minimize: false
# 			})
# 		obj[val] = x
# 	cb(obj)
# makeDefs(defs, console.log)

url = process.env.MONGOOSE_DB
mongoose.connect(url, (err)->
	if err
		return log.error {err:err}, "mongoose connection error"
	# console.log models:mongoose.modelNames()
	)
# mongoose.Promise = require("q")


exports.mongoose = mongoose
