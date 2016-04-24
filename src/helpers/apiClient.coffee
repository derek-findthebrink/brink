# creates api
request = require("superagent")
Q = require("q")

try
	log = appLogger.child({
		type: "helpers"
		file: "apiClient"
	})
catch
	log = console
	log.info = console.log

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
		log.info "get promise fulfilled"
		return def.resolve(JSON.parse res.text)
	return def.promise

module.exports = {
	get
}