Q = require("q")
React = require("react")
{renderToStaticMarkup} = require("react-dom/server")
mailcomposer = require("mailcomposer")
mongoose = require("mongoose")
backdraft = require("backdraft-js")
{
	EditorState
	convertFromRaw
} = require("draft-js")
handlebars = require("handlebars")

markup = {
	BOLD: ["<strong>", "</strong>"]
	ITALIC: ["<em>", "</em>"]
	H1: ["<h1>", "</h1>"]
	H2: ["<h2>", "</h2>"]
}


exports.actions = {
	SEND_WELCOME: "email/WELCOME"
}

try
	log = appLogger.child({
		type: "services"
		file: "mailgun"
	})
catch
	log = console
	log.info = console.log



config = {
	apiKey: process.env.MAILGUN_API
	domain: process.env.MAILGUN_DOMAIN
}


mailgun = require("mailgun-js")(config)

# Helpers
# -------------------------------------------------------
buildData = (model, html)->
	def = Q.defer()
	mail = mailcomposer({
		from: "\"Brink Technology\" <noreply@findthebrink.com>"
		to: model.email
		subject: "Welcome To Brink!"
		html: html
		})
	mail.build (mailErr, message)->
		if mailErr
			log.error err:mailErr, "error building mail"
			console.error mailErr
			return def.reject(mailErr)
		data = {
			to: model.email
			message: message.toString("ascii")
		}
		return def.resolve(data)
	return def.promise

send = (data)->
	def = Q.defer()
	mailgun.messages().sendMime(data, (sendErr, body)->
		# return error status
		if sendErr
			log.error err:sendErr, "error sending mailgun message"
			console.error sendErr
			return def.reject(sendErr)
		else
			log.info body:body, "success sending mailgun welcome"
			return def.resolve(body)
		)

getEmailMarkup = (ident)->
	def = Q.defer()
	Emails = mongoose.model("Email")
	promise = Emails.findOne({ident: ident}).exec()
	.then(
		(val)->
			def.resolve(val)
		(err)->
			log.error err:err, "get email markup error"
			def.reject(err)
		)
	return def.promise

convertEmail = (model)->
	email = model.content
	if !email.entityMap
		email.entityMap = {}
	# val = EditorState.createWithContent convertFromRaw(email)
	_v = backdraft email, markup
	return _v.join("<br />")

injectVars = (markup, model)->
	log.info markup:markup, model:model, "inject vars begins"
	template = handlebars.compile(markup)
	final = template(model)
	return final



# Final
# --------------------------------------------------

sendWelcome = (action)->
	model = action.model.toJSON()
	log.info model:model, "email model"
	p = getEmailMarkup("welcome")
	.then(
		(email)->
			# log.info email:email, "returned email"
			return convertEmail(email)
		(err)->
			log.error err:err, "email return fail"
			console.error err
			throw err
		)
	.then(
		(markup)->
			# log.info markup:markup, "email markup"
			return injectVars(markup, model)
		(err)->
			log.error err:err, "email markup conversion error"
			console.error err
			throw err
		)
	.then(
		(complete)->
			# log.info complete:complete, "completed email"
			return buildData(model, complete)
		(err)->
			log.error err:err, "error injecting vars"
			console.error err
			throw err
		)
	.then(
		(ready)->
			# log.info ready:ready, "email ready"
			return send(ready)
		(err)->
			log.error err:err, "error building ready email"
			console.error err
			throw err
		)
	return p

test = ->
	log.info "\n\n--- test ---\n"
	# mockup model
	action = {
		model:
			name: "Derek"
			email: "derek@findthebrink.com"
	}
	sendWelcome(action)
	.done ->
		log.info "\n--- end test ---\n\n"

# test()

exports.operations = {
	sendWelcome
}