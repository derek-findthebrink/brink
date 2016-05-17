Client = require("../../helpers/api-client")

exports.actions = {
	SAVE_EDIT: "edit/SAVE_MODEL"
	UPDATE_EDITOR: "edit/UPDATE_EDITOR"
	CREATE_EDITOR: "edit/CREATE_EDITOR"
	VALUE_PUSH: "edit/VALUE_PUSH"
	VALUE_SPLICE: "edit/VALUE_SLICE"
	ADD_ITEM: "add/ADD_MODEL"
	UPDATE_MODEL: "update/MODEL"
}

updateModel = (action, {getState, dispatch})->
	client = new Client()
	client.post(action)
	.then(
		(val)->
			console.log val:val, "returned updated"
		(err)->
			console.error err, "error returning updated model"
		)

saveEdit = (action, {getState, dispatch})->
	client = new Client()
	action.model = getState().edit	
	client.post(action)
	.then(
		(val)->
			console.log val:val, "returned"
		(err)->
			console.error err, "error returning"
		)

addModel = (action)->
	console.log action:action
	client = new Client()
	client.post(action)
	.then(
		(val)->
			console.log val:val, "returned add model success"
		(err)->
			console.error err, "returned add model error"
		)

exports.operations = {
	saveEdit
	addModel
}