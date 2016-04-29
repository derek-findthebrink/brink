{combineReducers} = require("redux")
{routerReducer} = require("react-router-redux")
{reducer} = require("redux-async-connect")
_ = require("lodash")

{actions} = require("../actions")

console.log actions:actions

{LOAD, LOADED} = actions.LoadActions

# Products
UPDATE_PRODUCT = "UPDATE_PRODUCTS"

productsInitial = {
	items: []
	isEdited: false
}

productReducer = (state = [], action)->
	switch action.type
		when UPDATE_PRODUCT
			s = _.clone(state)
			s = s.map (x, i)->
				if x._id == action._id
					y = _.clone(x)
					return y
				else
					return x
			return s
		else
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
		when UPDATE_PRODUCT
			s = _.clone(state)
			s.isEdited = true
			s.items = productReducer(s.items, action)
			return s
		else
			return state
# Stack
UPDATE_STACK = "UPDATE_STACK"

stackInitial = {
	items: []
	isEdited: false
}

stackItemReducer = (state = [], action)->
	switch action.type
		when UPDATE_STACK
			s = _.clone(state)
			s = s.map (x, i)->
				if x._id == action.model._id
					y = action.model
					y.modified = true
					return y
				else
					return x
			return s
		else
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
		when UPDATE_STACK
			s = _.clone(state)
			s.isEdited = true
			s.items = stackItemReducer(s.items, action)
			return s
		else
			return state

_reducers = {
	routing: routerReducer
	reduxAsyncConnect: reducer
	products: productsReducer
	stack: stackReducer
	}

App = combineReducers(_reducers)

module.exports = App