model = require("./types/model")
{SAVE_EDIT} = model.actions
{saveEdit} = model.operations

library = require("./types/library")
{ADD_ASSET, EDIT_ASSET, DELETE_ASSET} = library.actions
{addAsset, editAsset, deleteAsset} = library.operations

module.exports = dispatch = (store)->
	return (action)->
		switch action.type
			when SAVE_EDIT then return saveEdit(action, store)
			when ADD_ASSET then return addAsset(action)
			when EDIT_ASSET then return editAsset(action)
			when DELETE_ASSET then return deleteAsset(action)
			else
				console.log action:action, "error"
				console.error new Error("could not parse action")