#!/usr/bin/env coffee

require("coffee-react/register")

if process.env.PM2
	require("dotenv").config()

rootDir = process.env.APP_ROOT || nodepath.resolve(".", "..")

if process.env.NODE_ENV != "production"
	opts = {
		hook: true
		ignore: /(\/\.|~$|\.json$)/i
		language: "coffee-script/register"
	}
	if !require("piping")(opts)
		return

# WebpackIsomorphicTools = require("webpack-isomorphic-tools")
# global.webpackIsomorphicTools = new WebpackIsomorphicTools(require("../webpack/iso-config"))
# .development(process.env.NODE_ENV == "development")
# .server(rootDir, ->
# 	require("../api/api")
# 	)

require("../api/api")
