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

require("../models/users")
require("../models/account")
require("../models/stack")
require("../models/products")
require("../models/contact")
require("../models/about")
require("../models/portfolio")

url = process.env.MONGOOSE_DB
mongoose.connect(url, (err)->
	if err
		return log.error {err:err}, "mongoose connection error"
	)
# mongoose.Promise = require("q")

exports.mongoose = mongoose
