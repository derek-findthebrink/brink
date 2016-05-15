mongoose = require("mongoose")
Schema = mongoose.Schema

model = new Schema({
	title: String
	content: {}
	})

mongoose.model("Email", model)