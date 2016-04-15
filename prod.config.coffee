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

_serverPlugins = [
	new ExtractTextPlugin("style.css", {
		allChunks: true
		})
	new webpack.NoErrorsPlugin()
]




# Entry Points
# --------------------------------------------
_entryApp = ["./ui/js/app/index.coffee"]
_entryVendor = [
	"react"
	"react-dom"
	"lodash"
	"webcomponentsjs/webcomponents.min.js"
	"jquery"
	"slicknav/dist/jquery.slicknav.js"
	"waypoints/lib/jquery.waypoints.min.js"
]
# _entryViews = "./views/react/index.cjsx"
view_dir = nodepath.resolve(".", "views/react")
# _entryViews = {
# 	home: nodepath.join(view_dir, "home.cjsx")
# 	portfolio: nodepath.join(view_dir, "portfolio.cjsx")
# 	stack: nodepath.join(view_dir, "stack.cjsx")
# 	product: nodepath.join(view_dir, "product.cjsx")
# 	contact: nodepath.join(view_dir, "contact.cjsx")
# 	app: nodepath.join(view_dir, "app.cjsx")
# }
_entryViews = nodepath.join(view_dir, "index.cjsx")

# Development Additions
# ------------------------------------
if process.env.HMR == "true"
	_browserPlugins.push new webpack.HotModuleReplacementPlugin()
	_entryApp.push(hotMiddlewareScript)
	_entryVendor.push(hotMiddlewareScript)


_loaders = [
	{
		test: /\.coffee$/
		loaders: ["coffee"]
	}
]

__css_browser_pipe = "css?modules&importLoaders=1&localIdentName=[name]___[local]__[hash:base64:5]"


# BROWSER
# ---------------------------------------------
_cssLoaderBrowser = {
	test: /\.css$/
	# loader: ExtractTextPlugin.extract("css")
	loaders: ["style", __css_browser_pipe]
}
_scssLoaderBrowser = {
	test: /\.scss$/
	loaders: ["style", __css_browser_pipe, "sass"]
}
_sassLoaderBrowser = {
	test: /\.sass$/
	loaders: ["style", __css_browser_pipe, "sass"]
}
_cjsxLoaderBrowser = {
	test: /\.cjsx$/
	# loaders: ["react-hot", "coffee", "cjsx"]
	loaders: ["coffee", "cjsx"]
}



# SERVER
# ---------------------------------------------------------
# my cool loader
# _myCoolServerCssLoader = nodepath.join(__dirname, "loaders", "style-collector")
__css_server_pipe = "css?sourceMap&modules&importLoaders=1&localIdentName=[name]___[local]__[hash:base64:5]"
__w_sass = __css_server_pipe + "!sass"
__style_server_pipe = "style?-singleton"

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
		modulesDirectories: ["ui/js", "node_modules", "views/react", "assets/lib", "ui/css", "router", "content"]
	devtool: "source-map"

	plugins: _browserPlugins

	postcss: [
		autoprefixer({
			browsers: ["last 2 versions"]
			})
	]

	entry: {
		app: _entryApp
		vendor: _entryVendor
		# views: _entryViews
	}
	output:
		path: nodepath.join(__dirname, "assets")
		filename: "[name].js"
		publicPath: "/"
	module:
		loaders: _loaders.concat([_cssLoaderBrowser, _scssLoaderBrowser, _sassLoaderBrowser, _cjsxLoaderBrowser])
}






# Server
serverViews = {
	name: "server-side-views-package"
	entry: _entryViews
	target: "node"
	context: __dirname
	plugins: _serverPlugins
	resolveLoader:
		modulesDirectories: ["node_modules", "loaders"]
		extensions: ["", ".webpack-loader.js", ".web-loader.js", ".loader.js", ".js"],
		root: [nodepath.resolve("."), nodepath.resolve("./loaders")]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx", ".sass", ".scss", ".css"]
		root: [nodepath.resolve(".")]
		modulesDirectories: ["node_modules", "ui/css", "assets/lib", "views/react"]
	output:
		path: nodepath.resolve(process.cwd(), "assets")
		filename: "[name].generated.js"
		publicPath: "/"
		libraryTarget: "commonjs2"
	externals: /^[a-z\-0-9]+$/
	module:
		loaders: _loaders.concat([_cssLoaderServer, _sassLoaderServer, _scssLoaderServer, _cjsxLoaderServer])
}

module.exports = serverViews

# module.exports = serverViews