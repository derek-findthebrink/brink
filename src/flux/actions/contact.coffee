Q = require("q")
Client = require("../../helpers/apiClient")

SUBMIT_CONTACT = "contact/SUBMIT"

submitContact = (action, store)->
	console.log action:action
	client = new Client()
	.post("contact", action.model)
	.then(
		(val)->
			console.log val:val, "post contact succeeded"
		(err)->
			console.error err
			console.log "post to contact failed"
		)


exports.actions = {
	SUBMIT_CONTACT
}

exports.operations = {
	submitContact
}