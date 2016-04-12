nodepath = require("path")
webpack = require("webpack")

autoprefixer = require("autoprefixer")
ExtractTextPlugin = require("extract-text-webpack-plugin")

hotMiddlewareScript = "webpack-hot-middleware/client?path=/__webpack_hmr&timeout=20000&reload=true"


# config
# -----------------------------------
_plugins = [
	new webpack.ProvidePlugin({
		$: "jquery"
		jQuery: "jquery"
		"window.jQuery": "jquery"
		React: "react"
		})
	new webpack.optimize.CommonsChunkPlugin("vendor", "vendor.bundle.js", Infinity)
	new webpack.optimize.OccurrenceOrderPlugin()
	new webpack.NoErrorsPlugin()
	new ExtractTextPlugin("assets/bundle.css", {
		allChunks: true
		})
]

# entries
_entryApp = ["./ui/js/app/index.coffee"]
_entryVendor = [
	"react"
	"react-dom"
	"lodash"
	"webcomponentsjs/webcomponents.min.js"
	"jquery"
	"jquery-ui/jquery-ui.min.js"
	"slicknav/dist/jquery.slicknav.js"
	"waypoints/lib/jquery.waypoints.min.js"
]

# development add
# ------------------------------------
if process.env.NODE_ENV == "development"
	_plugins.push new webpack.HotModuleReplacementPlugin()
	
	_entryApp.push(hotMiddlewareScript)



# final
# --------------------------------------
module.exports = {
	context: __dirname
	resolveLoader:
		modulesDirectories: ["node_modules"]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx", ".sass", ".scss", ".css"]
		root: [nodepath.resolve(".")]
		# extensions: ["", ".js", ".coffee", ".cjsx"]
		modulesDirectories: ["ui/js", "node_modules", "views/react", "assets/lib", "ui/css"]
	devtool: "eval-source-map"

	plugins: _plugins

	postcss: [
		autoprefixer({
			browsers: ["last 2 versions"]
			})
	]

	entry: {
		app: _entryApp
		vendor: _entryVendor
	}
	output:
		path: nodepath.join(__dirname, "assets")
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
			{
				test: /\.sass$/
				# loader: ExtractTextPlugin.extract("style!css!sass")
				loaders: ["style", "css", "sass"]
				# include: sassDir
			}
			{
				test: /\.scss$/
				# loader: ExtractTextPlugin.extract("css!sass")
				loaders: ["style", "css", "sass"]
			}
			{
				test: /\.css$/
				# loader: ExtractTextPlugin.extract("css")
				loaders: ["style", "css"]
			}
		]
}