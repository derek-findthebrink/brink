contact = require("./types/contact")

{SUBMIT_CONTACT} = contact.actions
{submitContact} = contact.operations

notify = require("./types/notifications.coffee")
{NOTIFY_SUCCESS, NOTIFY_ERROR} = notify.actions
{notifySuccess, notifyError} = notify.operations


module.exports = dispatch = (store)->
	return (action)->
		switch action.type
			when SUBMIT_CONTACT then return submitContact(action, store)
			when NOTIFY_SUCCESS then return notifySuccess(action)
			when NOTIFY_ERROR then return notifyError(action)
			else
				console.log action:action
				console.error new Error("could not parse action")