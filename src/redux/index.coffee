{compose, createStore, applyMiddleware} = require("redux")
{logMiddleware} = require("./middleware")
App = require("./reducers/index")

if __DEVTOOLS__
	DevTools = require("../components/devtools.cjsx")
	enhancer = compose(
		applyMiddleware(logMiddleware)
		DevTools.instrument()
		)
else
	enhancer = applyMiddleware(logMiddleware)

configureStore = (initialState)->
	if initialState == null
		store = createStore(App, enhancer)
	else
		store = createStore(App, initialState, enhancer)

	if __DEVELOPMENT__
		if module.hot
			module.hot.accept("./reducers", ->
				store.replaceReducer(require('./reducers'))
				)

	return store

module.exports = configureStore