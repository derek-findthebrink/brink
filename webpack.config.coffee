autoprefixer = require("autoprefixer")
ExtractTextPlugin = require("extract-text-webpack-plugin")
BrowserSync = require("browser-sync-webpack-plugin")
nodepath = require("path")
webpack = require("webpack")


sassDir = nodepath.join(__dirname, "ui/css")
outDir = nodepath.join(__dirname, "assets")
console.log sassDir
console.log outDir

sassLoaders = [
	"css-loader"
	"postcss-loader"
	"sass-loader?indentedSyntax=sass&includePaths[]=" + sassDir
]


module.exports = {
	resolveLoader:
		modulesDirectories: ["node_modules"]
	resolve:
		# extensions: ["", ".js", ".coffee", ".cjsx", ".sass", ".scss", ".css"]
		extensions: ["", ".js", ".coffee", ".cjsx"]
		modulesDirectories: ["ui/js", "node_modules"]
	devtool: "eval-source-map"

	plugins: [
		# new webpack.HotModuleReplacementPlugin()
		new ExtractTextPlugin("bundle.css")
		new BrowserSync({
			host: "localhost"
			port: 3000
			online: false
			reloadDelay: 200
			proxy: "localhost:2150"
			files: ["views/**/*.jade", "assets/**/*.js", "assets/**/*.css"]
			})
	]

	postcss: [
		autoprefixer({
			browsers: ["last 2 versions"]
			})
	]

	entry: [
		# "webpack-hot-middleware/client"
		"./ui/js/index.coffee"
	]
	output:
		path: outDir
		filename: "[name].js"
		publicPath: "/"
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
			# {
			# 	test: /\.sass$/
			# 	loader: ExtractTextPlugin.extract("style", "css!sass")
			# 	# loaders: ["style", "css", "sass"]
			# 	include: sassDir
			# }
		]
	sassLoader:
		includePaths: sassDir
}