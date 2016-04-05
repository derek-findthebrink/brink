mongoose = require("mongoose")
Schema = mongoose.Schema

model = new Schema({
	category: String
	active: Boolean
	available: Boolean
	unitsAvailable: Number
	})

mongoose.model("Product", model)