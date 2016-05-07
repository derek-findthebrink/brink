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
	img: String
	includes: [String]
	price: {
		value: Number
		currency: String
		priceType:
			type: String
			default: "undefined"
	}
	learnData: {
		description: String
		inputs: [img]
		process: [img]
		result: String
		outputs: [img]
		callout: [img]
	}
	active:
		type: Boolean
		default: false
	unitsAvailable:
		type: Number
		default: 0
	})

mongoose.model("Product", model)