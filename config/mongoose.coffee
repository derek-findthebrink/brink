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


# loadModels = (arr)->
# 	modelDir = "../api/models"
# 	_.map arr, (x)->
# 		loc = modelDir + "/" + x
# 		require(loc)

# Models = ["account", "applications", "products"]
# loadModels(Models)

require("../api/models/account")
require("../api/models/applications")
require("../api/models/products")
require("../api/models/contact")

url = process.env.MONGOOSE_DB
mongoose.connect(url, (err)->
	if err
		return log.error {err:err}, "mongoose connection error"
	)
# mongoose.Promise = require("q")

exports.mongoose = mongoose
