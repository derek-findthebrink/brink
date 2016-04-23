# creates api
request = require("superagent")
Q = require("q")

# data functions
segmentUrl = (segment)->
	if __SERVER__
		url = "http://" + apiHost + ":" + apiPort + "/data/" + segment
	if __CLIENT__
		url = "/api/data/" + segment
	return url

get = (segment)->
	def = Q.defer()
	url = segmentUrl(segment)
	request
	.get(url)
	.end (err, res)->
		if err then return def.reject(err)
		return def.resolve(res.text)
	return def.promise

module.exports = {
	get
}