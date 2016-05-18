require("coffee-script/register")
nodepath = require("path")

require("dotenv").config({
	path: nodepath.resolve(__dirname, "../test/.test-env")
	})

require("../bin/api")
require("../bin/server")
require("../bin/blog")