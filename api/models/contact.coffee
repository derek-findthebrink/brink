mongoose = require("mongoose")
Schema = mongoose.Schema

try
	log = appLogger.child({
		type: "models"
		file: "contact"
	})
catch
	log = console
	log.info = console.log

model = new Schema({
	user:
		type: Schema.Types.ObjectId
		ref: "User"
	name: String
	email: String
	product:
		type: Schema.Types.ObjectId
		ref: "Product"
	description: String
	received:
		type: Date
		default: new Date()
	})


model.statics.add = (model)->
	self = this
	if model.product == "none" || model.product == ""
		delete model.product
	x = new self(model).save()
	.then(
		(val)->
			return val
		(err)->
			throw err
		)
	return x


mongoose.model("Contact", model)