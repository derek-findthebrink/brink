io = require("socket.io-client")

socket = io("", {path: "/ws"})
socket.on("news", (data)->
	console.log "socket news:", data
	)


# Requires
# -----------------------------
Flux = require("./flux.cjsx")

# App
# ---------------------------
app = window.app = {}

# google analytics
require("./modules/ga.js")

app.flux = new Flux().initialize()
