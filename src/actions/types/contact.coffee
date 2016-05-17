Q = require("q")
Client = require("../../helpers/api-client")

{validate, sanitize} = require("../../helpers/validation").contact

exports.actions = {
	SUBMIT_CONTACT: "contact/SUBMIT"
	MARK_CONTACT_COMPLETE: "contact/MARK_COMPLETE"
	MARK_CONTACT_IGNORE: "contact/MARK_IGNORE"
}

markComplete = (action, store)->
	console.log action:action, "mark complete"
	action.model.isNewContact = false

markIgnore = (action, store)->
	console.log action:action, "mark ignore"
	action.model.isNewContact = false

submitContact = (action, store)->
	def = Q.defer()
	console.log action:action
	promise = validate(action)
	.then(
		(a)->
			return sanitize(a)
		(err)->
			x = {
				type: "validation"
				err: err
			}
			def.reject(x)
			# ensures that post in next then is not called
			throw {err: "invalid"}
		)
	.then(
		(final)->
			console.log final:final
			client = new Client()
			.post(final)
			.then(
				(val)->
					return def.resolve(val)
				(err)->
					def.reject(err)
					throw err
				)
		)
	.catch (err)->
		if err.err == "invalid"
			return
		console.error err
	return def.promise


exports.operations = {
	submitContact
	markComplete
	markIgnore
}