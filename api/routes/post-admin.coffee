mongoose = require("mongoose")

try
	log = appLogger.child({
		type: "routes"
		file: "post-admin"
	})
catch
	log = console
	log.info = console.log

{ADD_ASSET, DELETE_ASSET, EDIT_ASSET} = require("../../src/actions/types/library").actions

{SAVE_EDIT, ADD_ITEM} = require("../../src/actions/types/model").actions

models = {
	library: mongoose.model("Library")
	products: mongoose.model("Product")
	stack: mongoose.model("Stack")
	portfolio: mongoose.model("Portfolio")
	about: mongoose.model("About")
	emails: mongoose.model("Email")
}

addModel = (req, res)->
	action = req.body
	x = new models[action.model]().save()
	.then(
		(val)->
			log.info val:val, "created model"
			res.json(val).end()
		(err)->
			log.error err:err, "error creating model"
			res.status(500).end()
		)

deleteLibrary = (req, res)->
	action = req.body
	models.library.remove({_id: action.model._id})
	.then(
		->
			return res.status(200).end()
		(err)->
			log.error err:err, action:action, "error deleting library asset"
			return res.status(500).end()
		)

addLibrary = (req, res)->
	action = req.body
	new models.library(action.model).save()
	.then(
		(val)->
			log.info val:val, "saved!"
			res.status(200).json(val).end()
		(err)->
			log.error err:err, action:action, "error saving library"
			res.status(500).end()
		)

editAsset = (req, res)->
	action = req.body
	action.modelType = "library"
	return saveEdit(req, res)

saveEdit = (req, res)->
	action = req.body
	model = models[action.modelType]
	log.info action:action, "save edit action"
	query = {
		_id: action.model._id
	}
	model.findOneAndUpdate(query, action.model)
	.then(
		(val)->
			log.info val:val, "returned updated model"
			res.json(val).end()
		(reason)->
			log.error err:reason, "error updating model"
			res.status(500).end()
		)

module.exports = go = (req, res)->
	action = req.body
	switch action.type
		when ADD_ASSET then return addLibrary(req, res)
		when SAVE_EDIT then return saveEdit(req, res)
		when DELETE_ASSET then return deleteLibrary(req, res)
		when EDIT_ASSET then return editAsset(req, res)
		when ADD_ITEM then return addModel(req, res)
		else
			err = new Error("could not parse action")
			log.error err:err, action:action, "error post-admin no parse"
			return res.status(500).end()