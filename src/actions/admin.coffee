model = require("./model")

{SAVE_EDIT} = model.actions
{saveEdit} = model.operations

module.exports = dispatch = (store)->
	return (action)->
		switch action.type
			when SAVE_EDIT then return saveEdit(action, store)
			else
				console.log action:action
				console.error new Error("could not parse action")