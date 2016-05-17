express = require("express")
mongoose = require("mongoose")
Q = require("q")
superagent = require("superagent")

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

verifyRecaptcha = (recaptcha, ip)->
	def = Q.defer()
	googleRecaptchaVerifyUrl = "https://www.google.com/recaptcha/api/siteverify"
	# if __DEVELOPMENT__
	# 	ip = 
	gdata = {
		# remoteip: ip || null
		secret: process.env.GOOGLE_RECAPTCHA_SECRET
		response: recaptcha
	}
	log.info gdata:gdata, "outgoing recaptcha data"
	superagent
	.get(googleRecaptchaVerifyUrl)
	.query(gdata)
	.end (err, res)->
		if err
			log.error err:err, gdata:gdata, "google recaptcha verify server error"
			return def.reject(err)
		else
			json = JSON.parse(res.text)
			if json.success
				return def.resolve(true)
			else
				log.warn response:res, data:json, "google recaptcha user rejection"
				return def.reject(json["error-codes"])
	return def.promise

submitContact = (req, res)->
	action = req.body
	contact = models.contact
	log.info action:action, "submit contact action"
	if req.user
		action.model.user = req.user._id

	ip = req.ip
	recaptcha = action.model.recaptcha

	verifyRecaptcha(recaptcha, ip)
	.then(
		(val)->
			return contact.add(action.model)
		(err)->
			log.error err:err, "recaptcha error"
			throw err
		)
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