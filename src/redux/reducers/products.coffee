_ = require("lodash")

products = (state = {}, action)->
	_addProduct = (prod)->
		s = _.clone(state)
		s.items.push(prod)
		return s
	_refreshProducts = (items)->
		s = _.clone(state)
		s.items = items
		return s

	console.log {state, action}, "products reducer"
	switch action.type
		when "reduxAsyncConnect/LOAD_SUCCESS"
			s = _.clone(state)
			s.items = action.data
			return s

	return state

module.exports = products