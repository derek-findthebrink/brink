nodepath = require("path")
webpack = require("webpack")

ExtractTextPlugin = require("extract-text-webpack-plugin")
_webpackIsomorphicToolsPlugin = require("webpack-isomorphic-tools/plugin")
webpackIsomorphicToolsPlugin = new _webpackIsomorphicToolsPlugin(require("./iso-config.coffee"))


_host = process.env.HOST || "localhost"
_port = (Number(process.env.PORT) + 1) || 3001
hotMiddlewareScript = "webpack-hot-middleware/client?path=http://" + _host + ":" + _port + "/__webpack_hmr&timeout=20000&reload=true"


# Plugins
# -----------------------------------
_browserPlugins = [
	new webpack.ProvidePlugin({
		$: "jquery"
		jQuery: "jquery"
		"window.jQuery": "jquery"
		React: "react"
		})
	new webpack.optimize.CommonsChunkPlugin("vendor", "vendor.bundle.js", Infinity)
	new webpack.optimize.OccurrenceOrderPlugin()
	new webpack.NoErrorsPlugin()
	new webpack.IgnorePlugin(/webpack-stats\.json$/)
	new webpack.DefinePlugin({
		__CLIENT__: true
		__SERVER__: false
		__DEVELOPMENT__: true
		__DEVTOOLS__: true
		})
	webpackIsomorphicToolsPlugin.development()
]

# _serverPlugins = [
# 	new ExtractTextPlugin("style.css", {
# 		allChunks: true
# 		})
# 	new webpack.NoErrorsPlugin()
# ]




# Entry Points
# --------------------------------------------
_entryApp = ["./ui/js/app/index.coffee"]
# _entryVendor = [
# 	"react"
# 	"react-dom"
# 	"lodash"
# 	"webcomponentsjs/webcomponents.min.js"
# 	"jquery"
# 	"waypoints/lib/jquery.waypoints.min.js"
# ]
# _entryGlobal = "global.sass"

# Development Additions
# ------------------------------------
_browserPlugins.push new webpack.HotModuleReplacementPlugin()
_entryApp.unshift(hotMiddlewareScript)
# _entryVendor.unshift(hotMiddlewareScript)


_loaders = [
	{
		test: /\.coffee$/
		loaders: ["coffee"]
	}
]

__css_browser_pipe = "css?sourceMap&modules&importLoaders=2&localIdentName=[name]___[local]__[hash:base64:5]"
__sass_browser_pipe = "sass?outputStyle=expanded&sourceMap"


# BROWSER
# ---------------------------------------------
_cssLoaderBrowser = {
	test: /\.css$/
	# loader: ExtractTextPlugin.extract("css")
	loaders: ["style", __css_browser_pipe]
}
_scssLoaderBrowser = {
	test: /\.scss$/
	loaders: ["style", __css_browser_pipe, __sass_browser_pipe]
}
_sassLoaderBrowser = {
	test: /\.sass$/
	loaders: ["style", __css_browser_pipe, __sass_browser_pipe]
}
_cjsxLoaderBrowser = {
	test: /\.cjsx$/
	# loaders: ["react-hot", "coffee", "cjsx"]
	loaders: ["react-hot", "coffee", "cjsx"]
}



# Final
# --------------------------------------

# Browser
browser = {
	name: "browser-app"
	context: nodepath.resolve(__dirname, "..")
	resolveLoader:
		modulesDirectories: ["node_modules"]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx", ".sass", ".scss", ".css"]
		# root: [nodepath.resolve(".")]
		# extensions: ["", ".js", ".coffee", ".cjsx"]
		modulesDirectories: ["ui/js", "node_modules", "views/react", "assets/public/lib", "ui/css", "router", "content"]
	devtool: "source-map"

	plugins: _browserPlugins

	entry: {
		app: _entryApp
		# vendor: _entryVendor
		# views: _entryViews
	}
	output:
		path: nodepath.resolve(__dirname, "..", "assets/public/")
		filename: "[name]-[hash].js"
		chunkFilename: "[name]-[chunkhash].js"
		publicPath: "http://" + _host + ":" + _port
	module:
		loaders: _loaders.concat([_cssLoaderBrowser, _scssLoaderBrowser, _sassLoaderBrowser, _cjsxLoaderBrowser])
}

module.exports = browser