fs = require("fs")
nodepath = require("path")

file = fs.readFileSync nodepath.resolve(process.env.APP_ROOT, "assets/robots.txt")

module.exports = (req, res)->
	res.send(file).end()