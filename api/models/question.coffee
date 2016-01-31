mongoose = require "mongoose"
Schema = mongoose.Schema

Question = new Schema({
	user: String
	question: String
	category: String
	type: String
	reoccur: {}
	dateLastAsked: Date
	})

module.exports = mongoose.model("Question", Question)