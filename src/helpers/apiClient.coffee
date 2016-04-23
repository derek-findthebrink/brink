# creates api
request = require("superagent")
Q = require("q")

# data functions
segmentUrl = (segment)->
	if __SERVER__
		url = "http://" + apiHost + ":" + apiPort + "/api/data/" + segment
	if __CLIENT__
		url = "/api/data/" + segment

get = (segment)->
	def = Q.defer()
	request
	.get(segmentUrl(segment))
	.end (err, res)->
		if err then return def.reject(err)
		return def.resolve(res)
	return def.promise

module.exports = {
	get
}