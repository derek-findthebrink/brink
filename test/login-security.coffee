chai = require("chai")
chai.should()
expect = chai.expect

Q = require("q")
request = require("superagent")
nodepath = require("path")
async = require("async")

require("dotenv").config({
	path: nodepath.resolve(__dirname, ".test-env")
	})

log = require("bunyan").createLogger({
	name: "test"
	file: "login-security"
})


# Connect to database
# Create and register good credential for user
# Create and register bad credential for user

describe "login security", ->
	log.info "\n\n------- Ensure API Server is running -------\n\n"
	apiRoot = "http://" + process.env.API_HOST + ":" + process.env.API_PORT
	loginRoute = apiRoot + "/admin-auth/login"
	log.info {
		API_URL: apiRoot
		DB: process.env.MONGOOSE_DB
		login: loginRoute
	}, "connecting to URL"
	mongoose = null
	Account = null

	before (done)->
		mongoose = require("../api/config/mongoose").mongoose
		Account = mongoose.model("Account")
		done()

	after ()->
		Account.remove({}).exec()
		.then ->
			db = mongoose.connections
			db.map (x, i)->
				x.close()

	# it "should sanitize registration routes input", (done)->
	# 	user = {
	# 		email: "testing@findthebrink.com javascript:console.log(\"hi there!\");"
	# 		password: "herpderpglerp<script>console.log('hello world');</script>"
	# 	}
	# 	x = new Account({email: user.email})
	# 	Account.register(x, user.password, (err)->
	# 		if err
	# 			log.error err:err, "account creation error"
	# 			done()
	# 		else
	# 			err = new Error("login was not sanitized")
	# 			done(err)
	# 		)
	goodUser = {
		email: "testing@findthebrink.com"
		password: "herdygoo"
	}
	badUser = {
		email: "javascript:console.log('hello there!');"
		password: "<script>console.log('hi there');</script>"
	}
	trickyUser = {
		email: "herp@findthebrink.com"
		password: "nerp"
	}


	it "should allow user registrations (model only, not web-accessible)", (done)->
		x = new Account({email: goodUser.email})
		Account.register(x, goodUser.password, (err)->
			if err
				log.error err:err, "error creating user"
			expect(err).to.be.null
			done()
			)

	it "should allow logins", (done)->
		request.post(loginRoute)
		.send(goodUser)
		.end (err, body)->
			# log.info err:err, "error allow login"
			expect(err.status).to.equal 404
			done()

	it "should sanitize login attempts", (done)->
		request.post(loginRoute)
		.send(badUser)
		.end (err, body)->
			# log.info err:err, "error on post"
			expect(err).to.not.be.null
			expect(err.status).to.equal 403
			done()

	# it "should be rate limited to 150", (done)->
	# 	this.timeout(10000)
	# 	count = 0
	# 	limit = 150
	# 	concurrency = 1

	# 	worker = (task, cb)->
	# 		task (err)->
	# 			return cb()
	# 	loginRequest = (cb)->
	# 		request
	# 		.post(loginRoute)
	# 		.send(trickyUser)
	# 		.end (err, body)->
	# 			if (!err && !err.status == 404)
	# 				return cb(err)
	# 			return cb()
	# 	queue = async.queue(worker, concurrency)
	# 	while count <= limit
	# 		queue.push(loginRequest)
	# 		count++

	# it "should block sign-in attempts on an account at 5 failed attempts", (done)->
		


	# it "should notify admin on sign-in attempts resulting in block"
	# it "should notify admin of over-limit ip addresses"