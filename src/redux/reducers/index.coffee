{combineReducers} = require("redux")
{routerReducer} = require("react-router-redux")
{reducer} = require("redux-async-connect")
products = require("./products")
app = require("./app")
contact = require("./contact")

_reducers = {
	routing: routerReducer
	reduxAsyncConnect: reducer
	products: products
	}

# if __CLIENT__
	# _reducers.app = app
	# _reducers.contact = contact


App = combineReducers(_reducers)

module.exports = App