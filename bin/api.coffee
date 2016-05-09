#!/usr/bin/env coffee
require("coffee-react/register")
nodepath = require("path")

if process.env.PM2
	require("dotenv").config()

rootDir = nodepath.resolve(".", "..")

global.__CLIENT__ = false
global.__SERVER__ = true
global.__DEVELOPMENT__ = process.env.NODE_ENV == "development"
global.__DEVTOOLS__ = process.env.DEVTOOLS == "true"

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
