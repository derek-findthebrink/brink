mongoose = require("mongoose")
Schema = mongoose.Schema
_ = require("lodash")
Q = require("q")

try
	log = appLogger.child({
		type: "models"
		file: "users"
	})
catch
	log = console
	log.info = console.log

ModelName = "User"

model = new Schema({
	ip:
		type: String
		required: true
	pageViews:
		type: Number
		default: 1
	noTrack:
		type: Boolean
		default: false
	viewList: [{
		url: String
		date:
			type: Date
			default: new Date()
		}]
	IPlocation:
		type: String
		default: "unknown"
	isNewInteraction:
		type: Boolean
		default: true
	})


###
Add Interaction
(ip, url) -> null

- ip matches with db or creates new
- adds view to view list
###

model.statics.addInteraction = (req)->
	self = this
	url = req.originalUrl
	ip = req.ip
	# if req.cookies
		# return the session cookie?
	promise = this.findByIp(req)
	.then(
		(match)->
			# if match is null, create new record
			if match == null
				x = new self({
					ip: ip
					viewList: [
						{
							date: new Date()
							url: url
						}
					]
					})
				# x.save()
				return x.save()
			# else add data to required fields
			else
				currentViews = match.get("pageViews")
				newView = {
					url: url
					date: new Date()
				}
				_update = {
					$set:
						pageViews: currentViews + 1
					$push:
						viewList: newView
				}
				return self.findOneAndUpdate({_id: match._id}, _update).exec()
		(err)->
			log.error err:err, "error matching ip"
		)
	.then(
		(val)->
			# log.info {val: val}, "model interaction saved"
			return
		(err)->
			log.error {err}, "model interaction error"
			console.error err
			return err
		)
	return promise


model.statics.findByIp = (req)->
	# log.info "find by ip ran"
	ip = req.ip
	promise = this.model(ModelName).findOne({
		ip: ip
		}).exec()
	.then(
		(match)->
			# either return matched model or null
			# log.info {match}, "match"
			return match
		(err)->
			log.error err:err, "error finding ip"
			return err
		)
	return promise


mongoose.model(ModelName, model)


# # test
# _User = mongoose.model("User")

# # _User.findByIp({ip: "192.168.1.1"})
# _User.addInteraction({ip: "192.168.1.1", originalUrl: "herp.com"})
# _User.addInteraction({ip: "192.168.1.1", originalUrl: "nerp.com"})