express = require("express")
Q = require("q")
mongoose = require("mongoose")

actions = require("../services/actions")

{GET_PAGE} = actions.get
{GET_AUTH} = actions.auth

# Only UNSECURE models allowed here
models = {
	products: mongoose.model("Product")
	portfolio: mongoose.model("Portfolio")
	about: mongoose.model("About")
	stack: mongoose.model("Stack")
	contact: mongoose.model("Contact")
	library: mongoose.model("Library")
}

try
	log = appLogger.child({
		type: "routes"
		file: "get-app"
	})
catch
	log = console
	log.info = console.log

getPageData = (action, res)->
	model = models[action.page]
	model.find().exec()
	.then(
		(docs)->
			return res.json(docs).end()
		(err)->
			log.error err:err, action:action, "error retrieving model"
			return res.status(500).end()
		)

getAuth = (req, res)->
	user = req.user
	if user
		return res.json(req.user).end()
	else
		return res.json(false).end()

go = (req, res)->
	action = req.query
	switch action.type
		when GET_PAGE then return getPageData(action, res)
		when GET_AUTH then return getAuth(req, res)
		else
			err = new Error("could not parse action")
			log.error err:err, "get-app action parsing error"
			# send 404 error?
			return res.status(500).end()


module.exports = go