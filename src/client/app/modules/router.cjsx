$ = require("jquery")
React = require("react")
{browserHistory, match, Router} = require("react-router")
{render} = require("react-dom")
router = require("../../../router/app-router.cjsx")
{Provider} = require("react-redux")
store = require("../../../redux")({products: []})

container = $("#app-container")[0]
history = browserHistory
routes = router(history)
match({history, routes}, (err, redirect, props)->
	main = (
		<Provider store={store}>
			<Router {...props} />
		</Provider>
		)
	render(main, container)
	)