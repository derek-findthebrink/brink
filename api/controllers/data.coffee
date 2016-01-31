mongoose = require "mongoose"

Questions = mongoose.model("Question")
# console.log(Questions)

get = (type) ->
	return (req, res)->
		type.find().exec((err, results)->
			if err
				console.log(err)
				throw err
			else
				res.send(results).end()
			)

update = (type)->
	return (req, res)->
		data = req.body
		id = data._id
		# user = data.user
		delete data._id
		# delete data.user
		type.update({
			_id: req.params.id
			}, req.body, {upsert: true}, (err, raw)->
				if err
					console.log(err)
					throw err
				else
					res.status(200).end()
				)

add = (type)->
	return (req, res)->
		console.log(req.body)
		# req.body.user = req.user._id
		type.create(req.body, (err, s)->
			if err
				res.status(500).end()
				throw err
			else
				res.send(s).end()
			)

rm = (type)->
	return (req, res)->
		type.remove({
			_id: req.params.id
			# user: req.user._id
			}, (err)->
				if err
					console.log(err)
					throw err
				else
					res.status(200).end()
				)


module.exports = {
	getQuestions: get(Questions)
	addQuestion: add(Questions)
	removeQuestion: rm(Questions)
	updateQuestion: update(Questions)
}