# require("../../css/index.sass")

# Requires
# -----------------------------
Flux = require("./flux")

# App
# ---------------------------
app = window.app = {}

# google analytics
require("./modules/ga")
# slicknav
# require("./modules/slicknav")
app.flux = new Flux().initialize()
# app.router = new Router()
