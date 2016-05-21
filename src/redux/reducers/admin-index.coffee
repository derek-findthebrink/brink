{combineReducers} = require("redux")
{routerReducer} = require("react-router-redux")
{reducer} = require("redux-async-connect")
_ = require("lodash")
{List, Map} = require("immutable")

Client = require("../../helpers/api-client")

{LOAD, LOADED} = require("../../actions/types/async-load").actions
{UPDATE_CSRF} = require("../../actions/types/csrf").actions

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
{CREATE_EDITOR, UPDATE_EDITOR, VALUE_PUSH, VALUE_SPLICE} = require("../../actions/types/model").actions

editInitial = {}

editReducer = (state = editInitial, action)->
	switch action.type
		when CREATE_EDITOR
			y = _.assign {}, action.model
			return y
		when VALUE_SPLICE
			console.log action:action, state:state
			arr = _.get(state, action.keys)
			arr.splice(action.index, 1)
			y = _.set(_.assign({}, state), action.keys, arr)
			console.log arr:arr
			console.log state:y, "final"
			return y
		when VALUE_PUSH
			arr = _.get(state, action.keys)
			arr.push(action.initial)
			y = _.set(_.assign({}, state), action.keys, arr)
			console.log arr:arr, final:y
			return y
		when UPDATE_EDITOR
			console.log action:action
			y = _.set(_.assign({}, state), action.keys, action.value)
			return y
		else
			return state






# User
# --------------------------------------------
userInitial = Map {
	isLoggedIn: false
	data: Map {}
	csrf: false
}

userReducer = (state = userInitial, action)->
	switch action.type
		when UPDATE_CSRF
			return state.set("csrf", action.value)
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



# Library
# ------------------------------------------------
libraryInitial = Map {
	items: List []
}

libraryReducer = (state = libraryInitial, action)->
	switch action.type
		when LOADED
			if action.key == "library"
				return state.set "items", action.data
			else
				return state
		else
			return state



# About
# ---------------------------------------------
aboutInitial = Map {
	items: List []
}

aboutReducer = (state = aboutInitial, action)->
	switch action.type
		when LOADED
			if action.key == "about"
				return state.set "items", action.data
			else
				return state
		else
			return state




# Portfolio
# ---------------------------------------------
portfolioInitial = Map {
	items: List []
}

portfolioReducer = (state = portfolioInitial, action)->
	switch action.type
		when LOADED
			if action.key == "portfolio"
				return state.set "items", action.data
			else
				return state
		else
			return state

# Emails
# ------------------------------------------------
emailInitial = Map {
	items: List []
}

emailReducer =(state = emailInitial, action)->
	switch action.type
		when LOADED
			if action.key == "emails"
				return state.set "items", action.data
			else
				return state
		else
			return state


# Contacts
# ---------------------------------------------
contactsInitial = Map {
	items: List []
}

contactsReducer = (state = contactsInitial, action)->
	switch action.type
		when LOADED
			if action.key == "contacts"
				return state.set "items", action.data
			else
				return state
		else
			return state

# Pages
# ----------------------------------------------
pagesInitial = Map {
	items: List []
}

pagesReducer = (state = pagesInitial, action)->
	switch action.type
		when LOADED
			if action.key == "pages"
				return state.set("items", action.data)
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
	library: libraryReducer
	portfolio: portfolioReducer
	about: aboutReducer
	emails: emailReducer
	contacts: contactsReducer
	pages: pagesReducer
	}

App = combineReducers(_reducers)

module.exports = App