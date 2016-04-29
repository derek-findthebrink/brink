_ = require("lodash")
{actions, selectProduct} = require("../actions/products")

{SELECT_PRODUCT, LOAD} = actions


initialState = {
	selected: null
	items: []
}

products = (state = initialState, action)->
	switch action.type
		when LOAD
			if action.key != "products"
				return state
			s = _.clone(state)
			s.items = action.data
			return s
		when SELECT_PRODUCT
			s = _.clone(state)
			s.selected = action.value
			return s
		else
			return state

module.exports = products