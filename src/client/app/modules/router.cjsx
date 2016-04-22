$ = require("jquery")
React = require("react")
{browserHistory, match, Router} = require("react-router")
{render} = require("react-dom")
router = require("../../../router/app-router.cjsx")

container = $("#app-container")[0]
history = browserHistory
routes = router(history)
match({history, routes}, (err, redirect, props)->
	render(<Router {...props} />, container)
	)