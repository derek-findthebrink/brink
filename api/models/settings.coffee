mongoose = require("mongoose")
Schema = mongoose.Schema

modelName = "Setting"

model = {
	segment: String
	type: String
	key: String
	value: String
}

exports.model = model

mongoose.model(modelName, model)