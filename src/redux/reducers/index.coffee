{combineReducers} = require("redux")
products = require("./products")
app = require("./app")

App = combineReducers({
	products: products
	app: app
	})

module.exports = App