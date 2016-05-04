global.__ADMIN__ = true


io = require("socket.io-client")
$ = require("jquery")
React = require("react")
{browserHistory, match, Router} = require("react-router")
{render} = require("react-dom")
{Provider} = require("react-redux")
{ReduxAsyncConnect} = require("redux-async-connect")
{syncHistoryWithStore} = require("react-router-redux")

router = require("./router/admin-router.cjsx")
store = require("./redux/admin-index")(null)
Client = require("./helpers/api-client")
Flux = require("./flux")

app = {}

if __DEVELOPMENT__
	window.app = app
	app.client = new Client()
	app.flux = new Flux(store)


# socketInit = ->
# 	socket = io("", {path: "/ws"})
# 	socket.on("news", (data)->
# 		console.log "socket news:", data
# 		)
# 	return socket

# app.socket = socketInit()


# router init
if __DEVELOPMENT__
	app.store = store
container = $("#app-container")[0]
history = syncHistoryWithStore(browserHistory, store)
routes = router(history, store)

_asyncRender = (props)->
	<ReduxAsyncConnect {...props} helpers={new Client()} />

match({history, routes}, (err, redirect, props)->
	main = React.createClass({
		render: ->
			<Provider store={store} key="provider">
				<Router {...props} render={_asyncRender} history={browserHistory} />
			</Provider>
		}) 
	render(React.createElement(main), container)
	)