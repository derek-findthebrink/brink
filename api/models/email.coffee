mongoose = require("mongoose")
Schema = mongoose.Schema

model = new Schema({
	title: String
	content: {}
	ident: String
	})

mongoose.model("Email", model)