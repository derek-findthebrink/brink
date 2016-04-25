mongoose = require("mongoose")
Schema = mongoose.Schema


model = new Schema({
	title: String
	})

mongoose.model("Portfolio", model)