io = require("socket.io-client")


init = ->
	socket = io("", {path: "/ws"})
	socket.on("news", (data)->
		console.log "socket news:", data
		)
	return socket

module.exports = init
