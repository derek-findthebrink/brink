nodepath = require("path")
webpack = require("webpack")

ROOT = nodepath.resolve(process.env.APP_ROOT)

ExtractTextPlugin = require("extract-text-webpack-plugin")
WebpackIsomorphicToolsPlugin = require("webpack-isomorphic-tools/plugin")
BrowserSyncPlugin = require("browser-sync-webpack-plugin")


_host = process.env.HOST || "localhost"
_port = (Number(process.env.PORT) + 1) || 3001
hotMiddlewareScript = "webpack-hot-middleware/client?path=http://" + _host + ":" + _port + "/__webpack_hmr&timeout=20000&reload=true"


# Plugins
# -----------------------------------
_browserPlugins = [
	new webpack.HotModuleReplacementPlugin()
	new webpack.IgnorePlugin(/webpack-stats\.json$/)
	new webpack.DefinePlugin({
		__DEVELOPMENT__: true
		__DEVTOOLS__: true
		})
	new WebpackIsomorphicToolsPlugin(require("./iso-config.coffee")).development()
	new BrowserSyncPlugin({
		host: "localhost"
		port: 3000
		proxy: "http://localhost:2150"
		}, {
			reload: false
			})
]


# Entry Points
# --------------------------------------------
_entryApp = [
	hotMiddlewareScript
	nodepath.resolve(ROOT, "src/client-app.cjsx")
]
_entryAdmin = [
	hotMiddlewareScript
	nodepath.resolve(ROOT, "src/admin-app.cjsx")
]
_entryPolyfill = [
	nodepath.resolve(ROOT, "src/helpers/polyfill.coffee")
]


_loaders = [
	{
		test: /\.coffee$/
		loaders: ["coffee"]
	}
]

__css_browser_pipe = "css?modules&importLoaders=2&sourceMap&localIdentName=[name]___[local]__[hash:base64:5]"
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
_htmlLoader = {
	test: /\.html$/
	loaders: ["html"]
}



# Final
# --------------------------------------

# Browser
browser = {
	name: "browser-app"
	context: ROOT
	resolveLoader:
		modulesDirectories: ["node_modules"]
	resolve:
		extensions: ["", ".js", ".coffee", ".cjsx", ".sass", ".scss", ".css"]
		modulesDirectories: ["node_modules", "assets/public/lib", "src"]
		alias:
			React: "react"
			react: "react"
	devtool: "eval-cheap-module-source-map"
	debug: true
	progress: true

	plugins: _browserPlugins

	entry: {
		app: _entryApp
		admin: _entryAdmin
		polyfill: _entryPolyfill
	}
	output:
		path: nodepath.resolve(ROOT, "assets/public/")
		filename: "[name]-[hash].js"
		chunkFilename: "[name]-[chunkhash].js"
		publicPath: "http://" + _host + ":" + _port + "/"
	module:
		loaders: _loaders.concat([
			_cssLoaderBrowser
			_scssLoaderBrowser
			_sassLoaderBrowser
			_cjsxLoaderBrowser
			_htmlLoader
			])
}

module.exports = browser