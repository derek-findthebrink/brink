nodepath = require("path")
webpack = require("webpack")

module.exports = {
	entry: "./ui/js/index.coffee"
	resolveLoader:
		modulesDirectories: ["node_modules"]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx"]
	output:
		path: nodepath.join __dirname, "assets"
		filename: "webpack-bundle.js"
	module:
		loaders: [
			{
				test: /\.coffee$/
				loaders: ["coffee"]
			}
			{
				test: /\.cjsx$/
				loaders: ["coffee", "cjsx"]
			}
		]
}