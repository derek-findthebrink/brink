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
	Portfolio = mongoose.model("Portfolio")
	About = mongoose.model("About")
	Stack = mongoose.model("Stack")
	User = mongoose.model("User")
	Contact = mongoose.model("Contact")
	

	models = [
		{
			name: "products"
			schema: Products
		}
		{
			name: "portfolio"
			schema: Portfolio
		}
		{
			name: "about"
			schema: About
		}
		{
			name: "stack"
			schema: Stack
		}

	]

	# get api
	_createApi = ({schema, name}, type, _app)->
		url = "/" + name
		_app[type](url, (req, res)->
			schema.find({}).exec()
			.then(
				(docs)->
					res.json(docs)
				(err)->
					log.error err:err, "api error"
					res.status(500).end()
				)
			)
	# create get api
	models.map (x)->
		return _createApi(x, "get", app)

	return app

module.exports = go