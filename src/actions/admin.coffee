model = require("./types/model")
{SAVE_EDIT} = model.actions
{saveEdit} = model.operations

library = require("./types/library")
{ADD_ASSET, EDIT_ASSET, DELETE_ASSET} = library.actions
{addAsset, editAsset, deleteAsset} = library.operations

model = require("./types/model")
{ADD_ITEM} = model.actions
{addModel} = model.operations

module.exports = dispatch = (store)->
	return (action)->
		switch action.type
			when SAVE_EDIT then return saveEdit(action, store)
			when ADD_ASSET then return addAsset(action)
			when EDIT_ASSET then return editAsset(action)
			when DELETE_ASSET then return deleteAsset(action)
			when ADD_ITEM then return addModel(action)
			else
				console.log action:action, "error"
				console.error new Error("could not parse action")