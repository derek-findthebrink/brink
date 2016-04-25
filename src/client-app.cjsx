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
client = require("./helpers/apiClient")


app = {}

if __DEVELOPMENT__
	window.app = app

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


socketInit = ->
	socket = io("", {path: "/ws"})
	socket.on("news", (data)->
		console.log "socket news:", data
		)
	return socket

app.socket = socketInit()


# router init
if __DEVELOPMENT__
	app.store = store
container = $("#app-container")[0]
history = syncHistoryWithStore(browserHistory, store)
routes = router(history)

_asyncRender = (props)->
	<ReduxAsyncConnect {...props} helpers={client} />

match({history, routes}, (err, redirect, props)->
	main = React.createClass({
		render: ->
			<Provider store={store} key="provider">
				<Router {...props} render={_asyncRender} history={browserHistory} />
			</Provider>
		}) 
	render(React.createElement(main), container)
	)