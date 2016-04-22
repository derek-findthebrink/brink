# Requires
# -----------------------------
Flux = require("./flux")



# App
# ---------------------------
app = window.app = {}

# google analytics
require("./modules/ga")

app.flux = new Flux()
app.socket = require("./modules/socket")()
require("./modules/router")
app.store = require("../../redux/create")