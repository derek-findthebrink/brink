exports.actions = {
	NOTIFY_SUCCESS: "notify/SUCCESS"
	NOTIFY_ERROR: "notify/ERROR"
	NOTIFY_UNHANDLED: "notify/UNHANDLED"
}

toastr = require("toastr")

notifySuccess = (action)->
	return toastr.success(action.msg)

notifyError = (action)->
	return toastr.error(action.msg)

notifyUnhandled = ->
	return toastr.error("Well this is embarrassing.. Something went wrong, we'll get right on fixing it!")

exports.operations = {
	notifySuccess
	notifyError
	notifyUnhandled
}