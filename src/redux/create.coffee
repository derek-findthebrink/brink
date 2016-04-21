{createStore, combineReducers, applyMiddleware} = require("redux")

userReducer = (state = {}, action)->
	console.log "Reducer called w/ state:", state, "and action", action

	switch action.type
		when "UPDATE_NAME" then return Object.assign(state, {name: action.value})
		else
			return state
	

itemsReducer = (state = [], action)->
	_addAndReturn = (val)->
		state.push(val)
		return state
	console.log "Reducer called w/ state:", state, "and action", action
	switch action.type
		when "ADD_ITEM" then return _addAndReturn(action.value)
		else
			return state

thunkMiddleware = ({ dispatch, getState })->
	return (next)->
		return (action)->
			if typeof action == "function"
				return action(dispatch, getState)
			else
				return next(action)

logMiddleware = ({ dispatch, getState })->
	return (next)->
		return (action)->
			console.log "log middleware received:", action
			return next(action)

asyncUpdateName = (name)->
	return (dispatch)->
		setTimeout(
			()->
				dispatch({
					type: "UPDATE_NAME"
					value: name
					})
			2000
			)

addItemActionCreator = (item)->
	return store0.dispatch({
		type: "ADD_ITEM"
		value: item
		})

finalCreateStore = applyMiddleware(thunkMiddleware, logMiddleware)(createStore)

reducer = combineReducers({
	user: userReducer
	items: itemsReducer
	})

store0 = finalCreateStore(reducer)

store0.subscribe ->
	console.log "store updated:", store0.getState()

console.log "\n\nInitial ===================\n\n"


store0.dispatch({
	type: "AN_ACTION"
	})
store0.dispatch({
	type: "UPDATE_NAME"
	value: "Derek"
	})
store0.dispatch({
	type: "ADD_ITEM"
	value: "herp"
	})
addItemActionCreator("derp")
addItemActionCreator("nerp")
addItemActionCreator("slerp")



store0.dispatch(asyncUpdateName("Herp"))

console.log "\n\n=============> Done!\n"