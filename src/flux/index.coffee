Q = require("q")

Client = require("../helpers/apiClient.coffee")

SAVE_EDIT = "SAVE_MODEL"

class Flux
	constructor: (@store)->
		@client = new Client()
		@getState = ->
			return @store.getState()
	dispatch: (action)->
		console.log action:action, "flux"
		switch action.type
			when SAVE_EDIT
				data = {}
				client = new Client()
				data.model = @getState().edit
				data.modelType = action.modelType
				segment = ["edit", data.modelType, data.model._id].join("/")
				console.log {data, segment}, "flux dispatch save edit"
				client.post(segment, data)
				.then(
					(val)->
						console.log val:val, "returned"
					(err)->
						console.error err:err, "error returning"
					)


module.exports = Flux