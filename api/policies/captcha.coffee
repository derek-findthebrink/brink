request = require("request")

exports.checkCaptcha = (req, res, next)->
	body = req.body
	reqOpts = {
		body:
			response: body["g-recaptcha-response"]
			secret: process.env.GOOGLE_RECAPTCHA_SECRET
			remoteip: req.ip
		json: true
		method: "POST"
		url: "https://www.google.com/recaptcha/api/siteverify"
	}
	log.info body:body, reqOpts: reqOpts, "checkCaptcha"

	_trueResponse = (response)->
		log.info {googleVerify: response}, "recaptcha success"
		next()
	_falseResponse = (response)->
		log.error {body: body, googleVerify: response}, "recaptcha fail"
		# add errors here
		res.redirect(req.originalUrl)

	_handler = (err, response, resBody)->
		console.log "\n", err:err, "\n"
		if err then return log.error {err:err}, "checkCaptcha handler failed"
		log.info {googleBody: resBody}, "checkCaptcha google response"
		switch resBody.success
			when true then return _trueResponse(resBody)
			when false then return _falseResponse(resBody)
			else
				log.error {err: new Error("could not parse captcha response"), googleVerify: resBody, body:body}, "recaptcha parse fail"

	# send data to google with appropriate keys
	# wait for response data
	request reqOpts, _handler