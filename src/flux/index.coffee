Q = require("q")

Client = require("../helpers/api-client.coffee")

if __CLIENT__
	dispatch = require("./actions/client.coffee")
else if __ADMIN__
	dispatch = require("./actions/admin.coffee")


class Flux
	constructor: (store)->
		@client = new Client()
		@dispatch = dispatch(store)
		@store = store
		@getState = ->
			return @store.getState()


module.exports = Flux