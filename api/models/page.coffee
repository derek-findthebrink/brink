mongoose = require("mongoose")
Schema = mongoose.Schema

modelName = "Page"

model = {
	title: String
	description: String
	link: String
	type: String
	meta: {
		description: String
		title: String
	}
}

exports.model = model

mongoose.model(modelName, model)