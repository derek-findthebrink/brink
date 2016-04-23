{createStore, applyMiddleware} = require("redux")
{Provider} = require("react-redux")

App = require("./reducers/index")

{logMiddleware} = require("./middleware")
_makeStore = applyMiddleware(logMiddleware)(createStore)

appStore = _makeStore(App)

appStore.subscribe ->
	console.log "app-store: updated->", appStore.getState()

module.exports = appStore
