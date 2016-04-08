nodepath = require("path")
webpack = require("webpack")

module.exports = {
	resolveLoader:
		modulesDirectories: ["node_modules"]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx"]
	devtool: "eval-source-map"

	plugins: [
		new webpack.HotModuleReplacementPlugin()
	]

	entry: [
		"webpack-hot-middleware/client"
		"./ui/js/index.coffee"
	]
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
				loaders: ["react-hot", "coffee", "cjsx"]
			}
		]
}