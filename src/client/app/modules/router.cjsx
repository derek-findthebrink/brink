$ = require("jquery")
React = require("react")
{browserHistory, match, Router} = require("react-router")
{render} = require("react-dom")
router = require("../../../router/app-router.cjsx")
{Provider} = require("react-redux")
{ReduxAsyncConnect} = require("redux-async-connect")

{syncHistoryWithStore} = require("react-router-redux")

store = require("../../../redux")(null)

if __DEVELOPMENT__
	app.store = store


client = require("../../../helpers/apiClient")
container = $("#app-container")[0]
history = syncHistoryWithStore(browserHistory, store)
routes = router(history)

_asyncRender = (props)->
	<ReduxAsyncConnect {...props} helpers={client} />

match({history, routes}, (err, redirect, props)->
	main = (
		<Provider store={store} key="provider">
			<Router {...props} render={_asyncRender} history={browserHistory} />
		</Provider>
		)
	render(main, container)
	)