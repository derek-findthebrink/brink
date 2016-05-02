{combineReducers} = require("redux")
{routerReducer} = require("react-router-redux")
{reducer} = require("redux-async-connect")
_ = require("lodash")
{List, Map} = require("immutable")

Client = require("../../helpers/apiClient")

{actions} = require("../actions")

# console.log actions:actions

{LOAD, LOADED} = actions.LoadActions

# Products
# ----------------------------------------
productsInitial = Map {
	items: List([])
}

productReducer = (state = [], action)->
	return state


productsReducer = (state = productsInitial, action)->
	switch action.type
		when LOADED
			if action.key == "products"
				y = state.set "items", action.data
				return y
			else
				return state
		else
			return state




# Stack
# ----------------------------------------
stackInitial = Map {
	items: List []
}

stackItemReducer = (state = [], action)->
	return state


stackReducer = (state = stackInitial, action)->
	switch action.type
		when LOADED
			if action.key == "stack"
				y = state.set "items", action.data
				return y
			else
				return state
		else
			return state





# Edit
# ----------------------------------------------
CREATE_EDITOR = "CREATE_EDITOR"
UPDATE_EDITOR = "UPDATE_EDITOR"

editInitial = {}

editReducer = (state = editInitial, action)->
	switch action.type
		when CREATE_EDITOR
			y = _.assign {}, action.model
			return y
		when UPDATE_EDITOR
			# console.log action:action
			y = _.set(_.assign({}, state), action.keys, action.value)
			return y
		else
			return state






# User
# --------------------------------------------
userInitial = Map {
	isLoggedIn: false
	data: Map {}
}

userReducer = (state = userInitial, action)->
	switch action.type
		when LOADED
			if action.key == "user"
				if action.data
					y = state
					.set("data", action.data)
					.set("isLoggedIn", true)
					return y
				else
					y = state
					.set("data", Map {})
					.set("isLoggedIn", false)
					return y
			else
				return state
		else
			return state




# Exports
# ---------------------------------------------

_reducers = {
	routing: routerReducer
	reduxAsyncConnect: reducer
	products: productsReducer
	stack: stackReducer
	edit: editReducer
	user: userReducer
	}

App = combineReducers(_reducers)

module.exports = App