express = require("express")

go = (mongoose)->
	app = express.Router()
	User = mongoose.model("User")

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

	return app

module.exports = go