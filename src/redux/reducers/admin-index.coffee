{combineReducers} = require("redux")
{routerReducer} = require("react-router-redux")
{reducer} = require("redux-async-connect")
_ = require("lodash")
Client = require("../../helpers/apiClient")

{actions} = require("../actions")

console.log actions:actions

{LOAD, LOADED} = actions.LoadActions

# Products
# ----------------------------------------
productsInitial = {
	items: []
}

productReducer = (state = [], action)->
	return state


productsReducer = (state = productsInitial, action)->
	switch action.type
		when LOADED
			if action.key == "products"
				s = _.clone(state)
				s.items = action.data
				return s
			else
				return state
		else
			return state
# Stack
# ----------------------------------------
stackInitial = {
	items: []
}

stackItemReducer = (state = [], action)->
	return state


stackReducer = (state = stackInitial, action)->
	switch action.type
		when LOADED
			if action.key == "stack"
				s = _.clone(state)
				s.items = action.data
				return s
			else
				return state
		else
			return state

# Edit
# ----------------------------------------------
CREATE_EDITOR = "CREATE_EDITOR"
UPDATE_EDITOR = "UPDATE_EDITOR"

editReducer = (state = {}, action)->
	switch action.type
		when CREATE_EDITOR
			return action.model
		when UPDATE_EDITOR
			s = _.clone(state)
			y = _.extend s, action.value
			return y
		else
			return state


userInitial = {
	isLoggedIn: false
	data: {}
}

userReducer = (state = userInitial, action)->
	switch action.type
		when LOADED
			if action.key == "user"
				console.log action
				s = _.clone(state)
				s.isLoggedIn = action.data ? true : false
				if s.isLoggedIn
					s.data = action.data
				return s
			else
				return state
		else
			return state

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