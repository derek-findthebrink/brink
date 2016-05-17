Q = require("q")

Client = require("../helpers/api-client.coffee")

if __ADMIN__
	# console.log "admin mode initiated"
	dispatch = require("../actions/admin.coffee")
else
	# console.log "client mode initiated"
	dispatch = require("../actions/client.coffee")


class Flux
	constructor: (store)->
		@client = new Client()
		@dispatch = dispatch(store)
		@store = store
		@getState = ->
			return @store.getState()


module.exports = Flux