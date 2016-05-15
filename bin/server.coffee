#!/usr/bin/env coffee
nodepath = require("path")

if process.env.PM2
	require("dotenv").config()

global.__CLIENT__ = false
global.__SERVER__ = true
global.__DEVELOPMENT__ = process.env.NODE_ENV == "development"
global.__DEVTOOLS__ = process.env.DEVTOOLS == "true"

log = require("bunyan").createLogger({
	name: "server-init"
	})

rootDir = nodepath.resolve(process.env.APP_ROOT)

global.__CLIENT__ = false
global.__SERVER__ = true
global.__DEVELOPMENT__ = process.env.NODE_ENV != "production"
global.__DEVTOOLS__ = process.env.NODE_ENV != "production"

global.__DISABLE_SSR__ = process.env.DISABLE_SSR == "true" || false
global.__DISABLE_SSR__ = process.env.NODE_ENV == "development" ? true || process.env.DISABLE_SSR == "false"


global.apiHost = process.env.API_HOST
global.apiPort = process.env.API_PORT


if __DEVELOPMENT__
	opts = {
		hook: true
		ignore: /(\/\.|~$|\.json$)/i
		language: "coffee-script/register"
	}
	if !require("piping")(opts)
		return


log.info {
	"env-vars":
		client: __CLIENT__
		server: __SERVER__
		ssrDisabled: __DISABLE_SSR__
		development: __DEVELOPMENT__
	env:
		node: process.env.NODE_ENV
	root: rootDir
}, "initializing webpack with vars"

WebpackIsomorphicTools = require("webpack-isomorphic-tools")
global.webpackIsomorphicTools = new WebpackIsomorphicTools(require("../webpack/iso-config"))
.development(__DEVELOPMENT__)
.server(rootDir, ->
	require("../src/server.coffee")
	)