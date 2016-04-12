mongoose = require("mongoose")
Schema = mongoose.Schema

contact = new Schema({
	user: String
	name: String
	email: String
	product: String
	description: String
	})

mongoose.model("Contact", contact)