global.__CLIENT__ = true
global.__SERVER__ = false
global.__ADMIN__ = false


io = require("socket.io-client")
$ = require("jquery")
React = require("react")
{browserHistory, match, Router} = require("react-router")
{render} = require("react-dom")
{Provider} = require("react-redux")
{ReduxAsyncConnect} = require("redux-async-connect")
{syncHistoryWithStore} = require("react-router-redux")


router = require("./router/app-router.cjsx")
store = require("./redux")(null)
Client = require("./helpers/api-client")
Flux = require("./flux")
useScroll = require("scroll-behavior")

app = {}
window.app = app

app.flux = new Flux(store)

if __DEVELOPMENT__
	app.client = new Client()
	window.$ = $
	window.React = React


# google analytics
if !__DEVELOPMENT__
	require("./helpers/analytics")

# socket


# socketInit = ->
# 	socket = io("", {path: "/ws"})
# 	socket.on("news", (data)->
# 		console.log "socket news:", data
# 		)
# 	return socket

# app.socket = socketInit()


# router init

launch = ->
	if __DEVELOPMENT__
		app.store = store
	container = $("#app-container")[0]
	_h = useScroll(browserHistory, (prev, loc)->
		pattern = /\/products-and-services/
		if prev
			# console.log prev:prev.pathname, loc:loc.pathname
			test = pattern.test(prev.pathname) && pattern.test(loc.pathname)
			# console.log test:test
			return !test
		else
			return true
		)
	history = syncHistoryWithStore(_h, store)
	routes = router(history, store)

	_asyncRender = (props)->
		<ReduxAsyncConnect {...props} helpers={new Client()} />

	match({history, routes}, (err, redirect, props)->
		main = React.createClass({
			render: ->
				<Provider store={store} key="provider">
					<Router {...props} render={_asyncRender} history={history} />
				</Provider>
			}) 
		render(React.createElement(main), container)
		)

{test, getVersion} = require("./helpers/ie-support")
if test()
	# IE-polyfill loading etc.
	app.IEVersion = getVersion()
	launch()
else
	app.IEVersion = false
	launch()