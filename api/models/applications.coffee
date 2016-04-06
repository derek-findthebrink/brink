mongoose = require("mongoose")
Schema = mongoose.Schema

model = new Schema({
	title: String
	logoUrl: String
	description: String
	})

mongoose.model("Application", model)