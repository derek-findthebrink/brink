mongoose = require("mongoose")
Schema = mongoose.Schema

model = new Schema({
	name: String
	description: String
	image: String
	})

mongoose.model("About", model)