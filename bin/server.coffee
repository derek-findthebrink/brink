#!/usr/bin/env coffee
nodepath = require("path")
# require("dotenv").config()

log = require("bunyan").createLogger({
	name: "webpack-isomorphic-init"
	})

rootDir = process.env.APP_ROOT || nodepath.resolve(".", "..")

global.__CLIENT__ = false
global.__SERVER__ = true
global.__DISABLE_SSR__ = false
global.__DEVELOPMENT__ = process.env.NODE_ENV != "production"
global.__DEVTOOLS__ = process.env.NODE_ENV != "production"

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
	require("../src/app.coffee")
	)