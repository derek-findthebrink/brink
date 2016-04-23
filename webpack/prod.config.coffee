# require("dotenv").config()
nodepath = require("path")
webpack = require("webpack")

ROOT = nodepath.resolve(__dirname, "..")

autoprefixer = require("autoprefixer")
ExtractTextPlugin = require("extract-text-webpack-plugin")
_webpackIsomorphicToolsPlugin = require("webpack-isomorphic-tools/plugin")
webpackIsomorphicToolsPlugin = new _webpackIsomorphicToolsPlugin(require("./iso-config.coffee"))

# Plugins
# -----------------------------------
plugins = [
	new ExtractTextPlugin("[name]-[chunkhash].css", {
		allChunks: true
		})
	# new webpack.NoErrorsPlugin()
	webpackIsomorphicToolsPlugin
	new webpack.DefinePlugin({
		__CLIENT__: true
		__SERVER__: false
		__DEVELOPMENT__: false
		__DEVTOOLS__: false
		})
]

# Entry Points
# --------------------------------------------
app_entry = nodepath.resolve(ROOT, "src/client/app/index.coffee")

# Loaders
# ------------------------------
_loaders = [
	{
		test: /\.coffee$/
		loaders: ["coffee"]
	}
]


# SERVER
# ---------------------------------------------------------
# my cool loader
# _myCoolServerCssLoader = nodepath.join(__dirname, "loaders", "style-collector")
__style_server_pipe = "style"
__css_server_pipe = "css?modules&importLoaders=2&sourceMap"
__w_sass = __css_server_pipe + "!sass?outputStyle=expanded&sourceMap=true&sourceMapContents=true"

_sassLoaderServer = {
	test: /\.sass$/
	loader: ExtractTextPlugin.extract(__style_server_pipe, __w_sass)
	# loaders: [
	# 	__style_server_pipe
	# 	__css_server_pipe
	# 	"sass"
	# ]
}
_scssLoaderServer = {
	test: /\.scss$/
	loader: ExtractTextPlugin.extract(__style_server_pipe, __w_sass)
	# loaders: [
	# 	__style_server_pipe
	# 	__css_server_pipe
	# 	"sass"
	# ]
}
_cssLoaderServer = {
	test: /\.css$/
	loader: ExtractTextPlugin.extract(__style_server_pipe, __css_server_pipe)
	# loaders: [
	# 	__style_server_pipe
	# 	"css?sourceMap"
	# ]
}
_cjsxLoaderServer = {
	test: /\.cjsx$/
	loaders: ["coffee", "cjsx"]
}
_jsonLoaderServer = {
	test: /\.json$/
	loader: "json-loader"
}



# Final
# --------------------------------------
# Server
serverViews = {
	name: "production-build"
	entry: 
		app: app_entry
	# target: "node"
	context: ROOT
	plugins: plugins
	devtool: "source-map"
	resolveLoader:
		modulesDirectories: ["node_modules"]
		# extensions: ["", ".webpack-loader.js", ".web-loader.js", ".loader.js", ".js"],
		# root: [nodepath.resolve("."), nodepath.resolve("./loaders")]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx", ".sass", ".scss", ".css"]
		root: ROOT
		modulesDirectories: ["node_modules", "assets/public/lib", "src"]
	output:
		path: nodepath.resolve(ROOT, "assets/public")
		filename: "[name].generated.js"
		chunkFilename: "[name]-[chunkhash].js"
		publicPath: "/"
		# libraryTarget: "commonjs2"
	# externals: /^[a-z\-0-9]+$/
	module:
		loaders: _loaders.concat([
			_cssLoaderServer
			_sassLoaderServer
			_scssLoaderServer
			_cjsxLoaderServer
			_jsonLoaderServer
			])
}

module.exports = serverViews
