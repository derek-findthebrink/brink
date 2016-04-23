logMiddleware = ({ dispatch, getState })->
	return (next)->
		return (action)->
			if typeof action == "function"
				console.log "log middleware received:", action
				return next(action)
			else
				return next(action)

module.exports = logMiddleware