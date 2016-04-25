#!/usr/bin/env coffee

if process.env.NODE_ENV != "production"
	opts = {
		hook: true
		ignore: /(\/\.|~$|\.json$)/i
		language: "coffee-script/register"
	}
	if !require("piping")(opts)
		return

require("../api/api")
