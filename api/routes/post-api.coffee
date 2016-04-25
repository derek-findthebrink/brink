express = require("express")

try
	log = appLogger.child({
		type: "routes"
		file: "post-api"
	})
catch
	log = console
	log.info = console.log

go = (mongoose)->
	app = express.Router()
	User = mongoose.model("User")
	Contact = mongoose.model("Contact")

	# tracking
	app.post("/addView", (req, res)->
		User.addInteraction(req)
		.then(
			()->
				# log.info "interaction saved successfully"
				res.status(200).end()
			(err)->
				log.error err:err, "error saving interaction"
				res.status(500).end()
			)
		)

	app.post("/contact", (req, res)->
		body = req.body
		log.info body:body, "contact body"
		Contact.add(req)
		.then(
			(val)->
				log.info val:val, "pre post-contact complete"
				res.redirect("/contact")
			(err)->
				res.redirect("/contact")
			)
		)

	return app

module.exports = go