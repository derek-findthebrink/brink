logMiddleware = ({ dispatch, getState })->
	return (next)->
		return (action)->
			console.log "log middleware received:", action
			if typeof action == "function"
				return next(action)
			else
				return next(action)

module.exports = logMiddleware