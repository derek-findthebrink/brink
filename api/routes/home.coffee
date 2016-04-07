express = require "express"
request = require("request")

request.debug = true

c = require "../controllers/home"

try
	log = appLogger.child({
		type: "route"
		file: "home"
		})
catch
	log = console
	log.info = console.log

home = express.Router()

home.get("/", c.home)
home.get("/portfolio", c.portfolio)
home.get("/stack", c.stack)
home.get("/products-and-services", c.productsAndServices)
home.get("/contact", c.contact)

home.get("/products-and-services/:sub", c.productsAndServicesSub)
home.get("/products-and-services/:category/:product", c.productLearn)


# Captcha, disabled while in development
checkCaptcha = (req, res, next)->
	body = req.body
	reqOpts = {
		body:
			response: body["g-recaptcha-response"]
			secret: "6LcEyRwTAAAAADTR-vRl5zOVP2h5tWo1c1tSru_1"
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

inputData = (req, res, next)->
	data = req.body
	log.info data:data, "contact post data"
	next()

renderThanks = (req, res)->
	res.redirect("/contact")


# Receive Customer Data
# captcha disabled while in development
home.post("/contact", inputData, renderThanks)
# home.post("/contact", checkCaptcha, inputData, renderThanks)

module.exports = home