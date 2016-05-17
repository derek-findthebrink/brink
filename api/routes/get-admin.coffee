express = require("express")
Q = require("q")
mongoose = require("mongoose")

{GET_PAGE} = actions.get

models = {
	library: mongoose.model("Library")
	emails: mongoose.model("Email")
}

try
	log = appLogger.child({
		type: "routes"
		file: "get-admin"
	})
catch
	log = console
	log.info = console.log

go = (req, res)->
	action = req.query
	switch action.type
		when GET_PAGE then return console.log(action)