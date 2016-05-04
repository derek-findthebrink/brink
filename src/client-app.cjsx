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


app = {}
window.app = app

app.flux = new Flux(store)

if __DEVELOPMENT__
	app.client = new Client()

# google analytics
`
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-52466507-2', 'auto');
ga('send', 'pageview');
`
# socket


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