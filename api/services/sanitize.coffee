validator = require("validator")

try
	log = appLogger.child({
		type: "services"
		file: "sanitize"
	})
catch
	log = console
	log.info = console.log


exports.login = sanitizeLogin = (req, res, next)->
	body = req.body
	log.info body:body, "login body"
	x = {
		email: validator.normalizeEmail validator.escape(body.email)
		password: validator.escape(body.password)
	}
	# log.info x:x, "sanitized body"
	if !x.email
		res.status(403).end()
	else
		req.body = x
		next()
