express = require("express")
Q = require("q")
mongoose = require("mongoose")

{GET_PAGE} = require("../services/actions").get

# Only UNSECURE models allowed here

Products = mongoose.model("Product")
Portfolio = mongoose.model("Portfolio")
About = mongoose.model("About")
Stack = mongoose.model("Stack")
Contact = mongoose.model("Contact")

models = {
	"products": Products
	"portfolio": Portfolio
	"about": About
	"stack": Stack
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

go = (req, res)->
	log.info body:req.body, query:req.query, "omg good stuff"
	action = req.query
	log.info bodyAction:action, query:req.query, "action requested"
	switch action.type
		when GET_PAGE then return getPageData(action, res)
		else
			err = new Error("could not parse action")
			log.error err:err, "get-app action parsing error"
			# send 404 error?
			return res.status(500).end()


module.exports = go