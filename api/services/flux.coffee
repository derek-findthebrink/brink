mailgun = require('./mailgun.cjsx')

{SEND_WELCOME} = mailgun.actions
{sendWelcome} = mailgun.operations

class Flux
	constructor: ->
	dispatch: (action)->
		switch action.type
			when SEND_WELCOME then return sendWelcome(action)
			else
				err = new Error("could not parse action")
				log.error {err, action}, "flux parse error"

module.exports = Flux