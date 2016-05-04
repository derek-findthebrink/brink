contact = require("./contact")

{SUBMIT_CONTACT} = contact.actions
{submitContact} = contact.operations

module.exports = dispatch = (store)->
	return (action)->
		switch action.type
			when SUBMIT_CONTACT then return submitContact(action, store)
			else
				console.log action:action
				console.error new Error("could not parse action")