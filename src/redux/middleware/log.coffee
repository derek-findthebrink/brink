logMiddleware = ({ dispatch, getState })->
	return (next)->
		return (action)->
			# if __CLIENT__ && __DEVELOPMENT__
				# console.log "log middleware received:", action
			if typeof action == "function"
				return next(action)
			else
				return next(action)

module.exports = logMiddleware