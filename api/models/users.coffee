mongoose = require("mongoose")
Schema = mongoose.Schema
_ = require("lodash")
Q = require("q")

try
	log = appLogger.child({
		type: "models"
		file: "users"
	})
catch
	log = console
	log.info = console.log

ModelName = "User"

model = new Schema({
	ip:
		type: String
		required: true
	noTrack:
		type: Boolean
		default: false
	IPlocation:
		type: String
		default: "unknown"
	sessions: [String]
	})

mongoose.model(ModelName, model)