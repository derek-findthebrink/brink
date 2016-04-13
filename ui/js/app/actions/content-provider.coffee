Q = require("q")

getContent = ->
	content = require('content/index')
	app.content = content
	console.log app


module.exports = {
	getContent
}