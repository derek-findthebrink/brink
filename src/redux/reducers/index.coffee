{combineReducers} = require("redux")
{routerReducer} = require("react-router-redux")
{reducer} = require("redux-async-connect")
# products = require("./products")
# app = require("./app")

App = combineReducers({
	routing: routerReducer
	reduxAsyncConnect: reducer
	# products: products
	# app: app
	})

module.exports = App