Q = require("q")
validator = require("validator")
_ = require("lodash")


contactValidate = (action)->
	# return true or false
	model = action.model
	err = {}
	# name is required
	if validator.isNull(model.name)
		err.name = "name is required"
	if !validator.isEmail(model.email)
		err.email = "email is not valid"
	if validator.isNull(model.email)
		err.email = "email is required"
	if model.shouldCall && validator.isNull(model.phone)
		err.phone = "phone is required if you would like us to call you"
	if !model.recaptcha
		err.recaptcha = "please solve the recaptcha"
	# email should be email and is required
	
	# warning on description?
	if _.keys(err).length > 0
		return Q.reject(err)
	else
		delete action.model.error
		return Q(action)

contactSanitize = (action)->
	{name, email, phone, product, description, shouldCall, recaptcha} = action.model
	# escape characters
	console.log action:action
	escape = (val)->
		console.log val:val
		return validator.escape(val)
	x = {
		name: escape(name)
		email: validator.normalizeEmail(escape(email))
		phone: escape(phone)
		product: escape(product)
		description: escape(description)
		shouldCall: if shouldCall then true else false
		recaptcha: escape(recaptcha)
	}
	console.log x:x
	# ? - do xss sanitization?
	# ? - verify model equality
	action.model = x
	return Q(action)

exports.contact = {
	validate: contactValidate
	sanitize: contactSanitize
}