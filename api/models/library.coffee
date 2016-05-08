mongoose = require("mongoose")
Schema = mongoose.Schema

model = new Schema({
	url: String
	alt: String
	type: String
	title: String
	})

mongoose.model("Library", model)