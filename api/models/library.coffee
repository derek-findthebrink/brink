mongoose = require("mongoose")
Schema = mongoose.Schema

model = new Schema({
	url: String
	alt: String
	})

mongoose.model("Library", model)