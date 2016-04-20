nodepath = require("path")
webpack = require("webpack")

autoprefixer = require("autoprefixer")
ExtractTextPlugin = require("extract-text-webpack-plugin")

hotMiddlewareScript = "webpack-hot-middleware/client?path=/__webpack_hmr&timeout=20000&reload=true"


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
_entryVendor = [
	"react"
	"react-dom"
	"lodash"
	"webcomponentsjs/webcomponents.min.js"
	"jquery"
	"waypoints/lib/jquery.waypoints.min.js"
]

# Development Additions
# ------------------------------------
if process.env.HMR == "true"
	_browserPlugins.push new webpack.HotModuleReplacementPlugin()
	_entryApp.unshift(hotMiddlewareScript)
	_entryVendor.unshift(hotMiddlewareScript)


_loaders = [
	{
		test: /\.coffee$/
		loaders: ["coffee"]
	}
]

__css_browser_pipe = "css?sourceMap&modules&importLoaders=1&localIdentName=[name]___[local]__[hash:base64:5]"
__sass_browser_pipe = "sass?sourceMap"


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
	context: __dirname
	resolveLoader:
		modulesDirectories: ["node_modules"]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx", ".sass", ".scss", ".css"]
		root: [nodepath.resolve(".")]
		# extensions: ["", ".js", ".coffee", ".cjsx"]
		modulesDirectories: ["ui/js", "node_modules", "views/react", "assets/public/lib", "ui/css", "router", "content"]
	devtool: "source-map"

	plugins: _browserPlugins

	entry: {
		app: _entryApp
		vendor: _entryVendor
		# views: _entryViews
	}
	output:
		path: nodepath.join(__dirname, "assets/public/")
		filename: "[name].js"
		publicPath: "/"
	module:
		loaders: _loaders.concat([_cssLoaderBrowser, _scssLoaderBrowser, _sassLoaderBrowser, _cjsxLoaderBrowser])
}

module.exports = browser