_ = require("lodash")

UPDATE = "CONTACT_FORM_UPDATE"

defState = {}

contact = (state = defState, action)->
	switch action.type
		when UPDATE
			s = _.clone(state)
			s[action.key] = action.value
			return s
		else
			return state

module.exports = contact