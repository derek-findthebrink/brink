_ = require("lodash")

LOADING = "reduxAsyncConnect/LOAD"
LOADING_DONE = "reduxAsyncConnect/LOAD_SUCCESS"

defState = {
	loading: false
}

app = (state = defState, action)->
	switch action.type
		when LOADING
			s = _.clone(state)
			s.loading = true
			return s
		when LOADING_DONE
			s = _.clone(state)
			s.loading = false
			return s
		else
			return state

module.exports = app