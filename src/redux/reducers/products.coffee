_ = require("lodash")

defState = {
	isFetching: true
	didInvalidate: false
	items: []
}
products = (state = defState, action)->
	_addProduct = (prod)->
		s = _.clone(state)
		s.items.push(prod)
		return s
	switch action.type
		when "ADD_PRODUCT" then return _addProduct(action.value)
		else
			return state

module.exports = products