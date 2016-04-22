{createStore, combineReducers, applyMiddleware} = require("redux")

productReducer = (state = [], action)->
	_addProduct = (prod)->
		state.push(prod)
		return state
	switch action.type
		when "ADD_PRODUCT" then return _addProduct(action.value)
		else
			return state

logMiddleware = ({ dispatch, getState })->
	return (next)->
		return (action)->
			if typeof action == "function"
				console.log "log middleware received:", action
				return next(action)
			else
				return next(action)

_makeStore = applyMiddleware(logMiddleware)(createStore)

appStore = _makeStore(productReducer)
appStore.subscribe ->
	console.log "app-store: updated->", appStore.getState()

module.exports = appStore
