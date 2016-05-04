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
	user: String
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


model.statics.add = (req)->
	self = this
	body = req.body
	if body.product == "none" || body.product == ""
		delete body.product
	if req.user
		body.user = req.user._id
	x = new self(body).save()
	.then(
		(val)->
			log.info val:val, "saved new contact"
			return val
		(err)->
			log.error err:err, "error saving new contact"
			return false
		)
	return x


mongoose.model("Contact", model)