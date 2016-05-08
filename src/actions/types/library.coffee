exports.actions = {
	ADD_ASSET: "library/ADD_ASSET"
	EDIT_ASSET: "library/EDIT_ASSET"
	DELETE_ASSET: "library/DELETE_ASSET"
}

Client = require("../../helpers/api-client")

addAsset = (action)->
	new Client().post(action)
	.then(
		(val)->
			console.log val:val, "success!"
			return val
		(reason)->
			console.log reason:reason, "fail"
			throw reason
		)

editAsset = (action)->
	new Client().post(action)
	.then(
		(val)->
			console.log val:val, "success!"
			return val
		(reason)->
			console.log action:action, reason:reason, "fail"
			throw reason
		)

deleteAsset = (action)->
	new Client().post(action)
	.then(
		->
			console.log val:val, "success"
			return
		(reason)->
			console.log action:action, reason:reason, "fail"
			throw reason
		)

exports.operations = {
	addAsset
	editAsset
	deleteAsset
}