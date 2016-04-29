{compose, createStore, applyMiddleware} = require("redux")
{logMiddleware} = require("./middleware")

App = require("./reducers/admin-index")

if __DEVTOOLS__
	DevTools = require("../components/devtools.cjsx")
	enhancer = compose(
		applyMiddleware(logMiddleware)
		DevTools.instrument()
		)
else
	enhancer = applyMiddleware(logMiddleware)

configureStore = (initialState)->
	if initialState
		store = createStore(App, initialState, enhancer)
	else
		store = createStore(App, enhancer)

	if __DEVELOPMENT__
		if module.hot
			module.hot.accept("./reducers", ->
				store.replaceReducer(require('./reducers'))
				)

	return store

module.exports = configureStore