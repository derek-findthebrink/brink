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
	# email should be email and is required
	
	# warning on description?
	if _.keys(err).length > 0
		return Q.reject(err)
	else
		delete action.model.error
		return Q(action)

contactSanitize = (action)->
	console.log action:action, "sanitize"
	model = action.model
	# escape characters
	x = _.mapValues model, (x)->
		return validator.escape(x)
	x.email = validator.normalizeEmail(x.email)
	# ? - do xss sanitization?
	# ? - verify model equality
	action.model = x
	return Q(action)

exports.contact = {
	validate: contactValidate
	sanitize: contactSanitize
}