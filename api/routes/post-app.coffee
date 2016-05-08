express = require("express")
mongoose = require("mongoose")

mailgun = require("../services/mailgun")
{SEND_WELCOME} = mailgun.actions
{SUBMIT_CONTACT} = require("../../src/actions/types/contact").actions

try
	log = appLogger.child({
		type: "routes"
		file: "post-api"
	})
catch
	log = console
	log.info = console.log

models = {
	contact: mongoose.model("Contact")
}

submitContact = (req, res)->
	action = req.body
	log.info action:action, "submit contact action"
	if req.user
		action.model.user = req.user._id
	models.contact.add(action.model)
	.then(
		(contact)->
			log.info contact:contact, "new contact created"
			# send email msg
			flux.dispatch({
				type: SEND_WELCOME
				model: contact
				})
			return res.status(200).end()
		(reason)->
			log.error err:reason, "new contact creation failed"
			return res.status(500).end()
		)

go = (req, res)->
	# add logic to parse post w/o js here
	action = req.body
	switch action.type
		when SUBMIT_CONTACT then return submitContact(req, res)
		else
			err = new Error("could not parse action")
			log.error err:err, action:action, "app-post parse error"
			return res.status(500).end()


module.exports = go