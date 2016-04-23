express = require("express")
Q = require("q")

try
	log = appLogger.child({
		type: "routes"
		file: "app-data"
	})
catch
	log = console
	log.info = console.log

go = (mongoose)->
	app = express.Router()
	Products = mongoose.model("Product")

	app.get("/products", (req, res)->
		Products.find({}).exec()
		.then(
			(docs)->
				res.send(docs).end()
			(err)->
				log.error err:err, "error retrieving products"
				res.status(500).end()
			)
		)

	return app

module.exports = go