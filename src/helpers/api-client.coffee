# creates api
superagent = require("superagent")
Q = require("q")

try
	log = appLogger.child({
		type: "helpers"
		file: "api-client"
	})
catch
	log = console
	log.info = console.log

# data functions
segmentUrl = (type)->
	if __SERVER__
		url = "http://" + apiHost + ":" + apiPort + "/" + type
	if __CLIENT__
		url = "/api/" + type
	return url


class Client
	constructor: (req)->
		@get = (action)->
			def = Q.defer()
			if typeof action == "string"
				action = {
					type: "api/PAGE_DATA"
					page: action
				}
			url = segmentUrl "app"
			request = superagent.get(url)
			.set("Accept", "application/json")
			if __SERVER__ && req.get("cookie")
				request.set("cookie", req.get("cookie"))
			if __ADMIN__
				action.isAdmin = true
			request.query(action)
			.end (err, body)->
				if __CLIENT__ && body.headers.csrf
					app.flux.dispatch({
						type: "csrf/UPDATE"
						value: body.headers.csrf
						})
				if err then return def.reject(err)
				if body.type == "application/json"
					return def.resolve JSON.parse(body.text)
				return def.resolve(body.text)
			return def.promise

		@post = (action)->
			def = Q.defer()
			if __ADMIN__
				url = segmentUrl("admin/post")
			else
				url = segmentUrl("post")
			request = superagent.post(url)
			.send(action)
			.set("Accept", "application/json")
			if __SERVER__ && req.get("cookie")
				request.set("cookie", req.get("cookie"))
			request.end (err, body)->
				if err then return def.reject(err)
				if body.type == "application/json"
					return def.resolve JSON.parse(body.text)
				return def.resolve(body.text)
			return def.promise

		@auth = ()->
			def = Q.defer()
			action = {
				type: "api/GET_AUTH"
			}
			url = segmentUrl "app"
			request = superagent
			.get(url)
			.query(action)
			.set("Accept", "application/json")
			if __SERVER__ && req.get("cookie")
				request.set("cookie", req.get("cookie"))
			request.end (err, body)->
				if err then return def.reject(err)
				if body.type == "application/json"
					return def.resolve JSON.parse(body.text)
				return def.resolve(body.text)
			return def.promise

module.exports = Client
