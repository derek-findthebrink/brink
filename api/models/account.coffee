mongoose = require "mongoose"
passportLocalMongoose = require "passport-local-mongoose"
Schema = mongoose.Schema

acctOpts = {
	saltlen: 512
	# iterations: Math.pow(10, 6)
	keylen: 1024
	usernameField: "email"
	saltField: "salt"
	hashField: "hash"
	attemptsField: "attempts"
	lastLoginField: "last"
	usernameLowerCase: true
	limitAttempts: true
	maxAttempts: 5
	usernameQueryFields: ["email"]
}


Account = new Schema({
	username: String
	email: String
	name: String
	password: String
	phone: Number
	accessAdmin:
		type: Boolean
		default: false
	adminType: String
	})

acctOpts = acctOpts || {}
Account.plugin(passportLocalMongoose, acctOpts)

mongoose.model("Account", Account)