_ = require("lodash")

products = (state = {}, action)->
	console.log {state, action}, "products reducer"
	switch action.type
		when "reduxAsyncConnect/LOAD_SUCCESS"
			s = action.data
			return s

	return state

module.exports = products