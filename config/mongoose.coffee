mongoose = require("mongoose")
_ = require("lodash")

try
	log = appLogger.child({
		type: "config"
		file: "mongoose"
		})
catch e
	log = console
	log.info = console.log


loadModels = (arr)->
	modelDir = "../api/models"
	_.map arr, (x)->
		loc = modelDir + "/" + x
		require(loc)

Models = ["account", "applications", "products"]
loadModels(Models)

url = process.env.MONGOOSE_DB
mongoose.connect(url)

exports.mongoose = mongoose

log.info models:mongoose.modelNames(), "loaded models"