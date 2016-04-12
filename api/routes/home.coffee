express = require "express"
request = require("request")
mongoose = require("mongoose")

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
home.get("/contact/:category/:product", c.contactProduct)

home.get("/products-and-services/:sub", c.productsAndServicesSub)
home.get("/products-and-services/:category/:product", c.productLearn)


# Captcha, disabled while in development
checkCaptcha = require("../policies/captcha")
Contact = mongoose.model("Contact")
inputData = c.inputData
renderThanks = c.renderThanks

# Receive Customer Data
# captcha disabled while in development

home.post("/contact", inputData, renderThanks)
# home.post("/contact", checkCaptcha, inputData, renderThanks)

module.exports = home