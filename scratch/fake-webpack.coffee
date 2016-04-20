nodepath = require("path")
webpack = require("webpack")

ExtractTextPlugin = require("extract-text-webpack-plugin")

ROOT = "/home/derek/developer/btsync/Developer/server/brink"

entry = {
	header: nodepath.resolve(ROOT, "views/react/modules/header")
}

config = {
	context: ROOT
	resolveLoader:
		root: ROOT
		modulesDirectories: ["node_modules", "loaders"]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx", ".sass", ".scss", ".css"]
		root: ROOT
		modulesDirectories: ["ui/js", "node_modules", "views/react", "assets/lib", "ui/css", "router", "content"]
	output:
		path: nodepath.resolve(ROOT, "scratch")
		filename: "[name].js"
		publicPath: "/"
	entry: entry
}

console.log config