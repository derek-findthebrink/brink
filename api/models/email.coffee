mongoose = require("mongoose")
Schema = mongoose.Schema

model = new Schema({
	title: String
	content: String
	})

mongoose.model("Email", model)