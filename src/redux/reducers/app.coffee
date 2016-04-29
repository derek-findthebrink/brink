_ = require("lodash")

LOADING = "reduxAsyncConnect/LOAD"
LOADING_DONE = "reduxAsyncConnect/LOAD_SUCCESS"

defState = {
	loading: false
	isLoggedIn: false
	user: {
		name: ""
		email: ""
		username: ""
	}
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
			if action.key == "user"
				s.isLoggedIn = action.data.isLoggedIn
				if action.data.isLoggedIn
					s.user = action.data.user
			return s
		else
			return state

module.exports = app