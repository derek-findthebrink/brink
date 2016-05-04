Q = require("q")
React = require("react")
{renderToStaticMarkup} = require("react-dom/server")
mailcomposer = require("mailcomposer")

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


Email = React.createClass({
	render: ->
		log.info props:@props
		<div>
			<p>Hello {@props.name},</p>
			<p>
				Welcome to Brink Technology! We have received your request
				and are looking forward to getting started on your project.
			</p>
			<p>
				You will soon be receiving an email with an attached login
				link to your Brink Technology account. From there you will
				be able to track the status of your request, ask us any questions
				you have about your project and keep tabs on its process.
			</p>
			<p>
				Thank you for choosing Brink Technology! We're looking forward to 
				working with you.
			</p>
			<p>
				Chat soon, <br /><br />
				Derek Moore <br />
				Principal Designer<br />
				Brink Technology Co.
			</p>
		</div>
	})



sendWelcome = (action)->
	def = Q.defer()
	model = action.model.toJSON()
	log.info action:action, "sendWelcome action"
	# create html
	_e = React.createElement(Email, model)
	html = renderToStaticMarkup(_e)
	# log.info html:html, "sendWelcome final markup"
	# send message
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
		log.info data:data, "outgoing email data"
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
	return def.promise


exports.operations = {
	sendWelcome
}