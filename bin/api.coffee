#!/usr/bin/env coffee
if process.env.PM2
	require("dotenv").config({path: "../.env"})

if process.env.NODE_ENV != "production"
	opts = {
		hook: true
		ignore: /(\/\.|~$|\.json$)/i
		language: "coffee-script/register"
	}
	if !require("piping")(opts)
		return

require("../api/api")
