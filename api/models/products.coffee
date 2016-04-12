mongoose = require("mongoose")
Schema = mongoose.Schema

img = {
	img: String
	alt: String
	description: String
}

model = new Schema({
	category: String
	product: String
	title: String
	description: String
	includes: [String]
	active: Boolean
	learnData: {
		inputs: [img]
		process: [img]
		result: String
		outputs: [img]
		callout: [img]
	}
	available:
		type: Boolean
		default: false
	unitsAvailable:
		type: Number
		default: 0
	})

mongoose.model("Product", model)