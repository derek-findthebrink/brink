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
segmentUrl = (type, segment)->
	if __SERVER__
		url = "http://" + apiHost + ":" + apiPort + "/" + type + "/" + segment
	if __CLIENT__
		url = "/api/" + type + "/" + segment
	return url

get = (segment)->
	def = Q.defer()
	url = segmentUrl("get", segment)
	log.info url:url, "client url"
	request
	.get(url)
	.set("Accept", "application/json")
	.end (err, res)->
		if err then return def.reject(err)
		return def.resolve(JSON.parse res.text)
	return def.promise

post = (segment, data)->
	def = Q.defer()
	url = segmentUrl("post", segment)
	request
	.post(url)
	.send(data)
	.set("Accept", "application/json")
	.end (err, res)->
		if err then return def.reject(err)
		return def.resolve(JSON.parse res.text)
	return def.promise


module.exports = {
	get
	post
}