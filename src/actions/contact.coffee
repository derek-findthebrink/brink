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
			def.reject(err)
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