Q = require("q")
Client = require("../helpers/api-client")

{validate, sanitize} = require("../helpers/validation").contact

SUBMIT_CONTACT = "contact/SUBMIT"

exports.actions = {
	SUBMIT_CONTACT
}

submitContact = (action, store)->
	def = Q.defer()
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
			client = new Client()
			.post("contact", final.model)
			.then(
				(val)->
					return def.resolve(val)
				(err)->
					return def.reject(err)
				)
		)
	.catch (err)->
		if err.err == "invalid"
			return
		console.error err
	return def.promise


exports.operations = {
	submitContact
}