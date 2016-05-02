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
	Stack = mongoose.model("Stack")
	Product = mongoose.model("Product")

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

	# secure this shit!!
	app.post("/edit/:section/:id", (req, res)->
		body = req.body
		log.info body:body
		switch body.modelType
			when "stack" then _m = Stack
			when "products" then _m = Product 
			else
				log.error new Error "could not parse type", "error parsing type"
		model = body.model
		id = model._id
		delete model._id
		_m.findOneAndUpdate(_id: id, model).exec()
		.then(
			(doc)->
				log.info doc:doc, "update successful"
				res.json(doc).end()
			(err)->
				log.error err:err, "update failed"
				res.status(500).send(err).end()
		)
		)

	return app

module.exports = go