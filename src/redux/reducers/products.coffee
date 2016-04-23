products = (state = [], action)->
	_addProduct = (prod)->
		state.push(prod)
		return state
	switch action.type
		when "ADD_PRODUCT" then return _addProduct(action.value)
		else
			return state

module.exports = products