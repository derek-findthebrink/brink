{combineReducers} = require("redux")
products = require("./products")

App = combineReducers({
	products: products
	})

module.exports = App