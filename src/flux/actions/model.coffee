Client = require("../../helpers/api-client")

SAVE_EDIT = "SAVE_MODEL"

exports.actions = {
	SAVE_EDIT
}

saveEdit = (action, {getState, dispatch})->
	client = new Client()
	action.model = getState().edit	
	segment = ["edit", action.modelType, action.model._id].join("/")
	client.post(segment, action)
	.then(
		(val)->
			console.log val:val, "returned"
		(err)->
			console.error err:err, "error returning"
		)


exports.operations = {
	saveEdit
}