_ = require("lodash")

LOADING = "reduxAsyncConnect/LOAD"
LOADING_DONE = "reduxAsyncConnect/LOAD_SUCCESS"

{UPDATE_CSRF} = require("../../actions/types/csrf").actions

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
		when UPDATE_CSRF
			s = _.clone(state)
			s.csrf = action.value
			return s
		else
			return state

module.exports = app