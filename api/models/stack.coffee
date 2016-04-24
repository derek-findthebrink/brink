mongoose = require("mongoose")
Schema = mongoose.Schema

model = new Schema({
	title: String
	img:
		src: String
		alt: String
		href: String
	description: String
	secondary:
		type: Boolean
		default: true
	CSSClass: {}
	meta:
		language:
			type: String
			default: "english"
	})

mongoose.model("Stack", model)