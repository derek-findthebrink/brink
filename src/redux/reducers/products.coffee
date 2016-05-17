_ = require("lodash")
{LOADED} = require("../../actions/types/async-load").actions


initialState = {
	selected: null
	items: []
}

products = (state = initialState, action)->
	switch action.type
		when LOADED
			if action.key == "products"
				s = _.clone(state)
				s.items = action.data
				return s
			else
				return state
		else
			return state

module.exports = products