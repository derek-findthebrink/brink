mongoose = require("mongoose")
Schema = mongoose.Schema

img = {
	img: String
	alt: String
	description: String
}

model = new Schema({
	project: String
	type: String
	img: String
	alt: String
	commissioner: String
	status: String
	description: String
	includes: [String]
	includesImg: [img]
	})

mongoose.model("Portfolio", model)