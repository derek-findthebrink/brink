mongoose = require "mongoose"
Schema = mongoose.Schema
passportLocalMongoose = require "passport-local-mongoose"

Account = new Schema({
	username: String
	email: String
	password: String
	accessAdmin:
		type: Boolean
		default: false
	adminType: String
	})

Account.plugin(passportLocalMongoose)

module.exports = mongoose.model("Account", Account)