# Requires
# -----------------------------
Flux = require("./flux.cjsx")



# App
# ---------------------------
app = window.app = {}

# google analytics
require("./modules/ga.js")

app.flux = new Flux()
app.socket = require("./modules/socket")()
require("./modules/router")