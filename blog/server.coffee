express = require("express")
ghost = require("ghost")
nodepath = require("path")

app = express()

ghostOpts = {
	config: nodepath.join(__dirname, "config.js")
}

ghost(ghostOpts).then (ghostServer)->
	ghostServer.start()