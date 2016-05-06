exports.actions = {
	NOTIFY_SUCCESS: "notify/SUCCESS"
	NOTIFY_ERROR: "notify/ERROR"
}

toastr = require("toastr")

notifySuccess = (action)->
	return toastr.success(action.msg)

notifyError = (action)->
	return toastr.error(action.msg)

exports.operations = {
	notifySuccess
	notifyError
}