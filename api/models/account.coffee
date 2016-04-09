mongoose = require "mongoose"
Schema = mongoose.Schema
passportLocalMongoose = require "passport-local-mongoose"

acctOpts = {
	saltlen: 512
	iterations: Math.pow(10, 6)
	keylen: 1024
	usernameField: "username"
	saltField: "salt"
	hashField: "hash"
	attemptsField: "attempts"
	lastLoginField: "last"
	usernameLowerCase: true
	limitAttempts: true
	maxAttempts: 5
	usernameQueryFields: ["email", "phone"]
}


Account = new Schema({
	username: String
	email: String
	phone: Number
	password: String
	accessAdmin:
		type: Boolean
		default: false
	adminType: String
	})


Account.plugin(passportLocalMongoose, acctOpts)
mongoose.model("Account", Account)